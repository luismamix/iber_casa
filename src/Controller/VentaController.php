<?php

namespace App\Controller;

use App\Repository\InmuebleRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\Status1Repository;
use App\Repository\UsuarioRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Venta;
use App\Repository\VentaRepository;
use Symfony\Component\Security\Core\Security;

/**
 * @Route("/venta")
 */
class VentaController extends AbstractController
{
    /**
     * @Route("/index", name="venta_index")
     */
    public function index(VentaRepository $vr, Security $security): Response
    {   
        $ventas = $vr->findAll();

        $todas_las_ventas = $vr->findAll();
        $ventas= array();

        //ROLE_ADMIN puede ver todas las ventas.
        if($security->isGranted('ROLE_ADMIN')){
            $ventas = $todas_las_ventas;
        }

        //ROLE_VENDEDOR puede ver solo sus ventas (d los inmuebles q es propietario).
        if($security->isGranted('ROLE_VENDEDOR')){
            $misventas = array();
            foreach($todas_las_ventas as $venta) {
                if($this->getUser() === $venta->getInmueble()->getUsuario())
                $misventas[] = $venta;
            }
            $ventas =  $misventas;
        } 


        return $this->render('venta/index.html.twig', [
            'controller_name' => 'VentaController',
            'ventas' => $ventas
        ]);
    }

    /**
     * @Route("/form_venta/{id}", name="form_venta", requirements={"id"="\d+"})
     */
    public function form_venta($id, InmuebleRepository $ir): Response
    {   
        $inmueble  = $ir->find($id);
        
        //comprobar si existe el inmueble
        if(!$inmueble){
            throw $this->createNotFoundException('Este Inmueble no existe'); 
        }

        $user = $this->getUser();

        return $this->render('venta/form_venta.html.twig', [
            'controller_name' => 'VentaController',
            'inmueble' => $inmueble ,
            'user' => $user
        ]);
    }

    /**
     * @Route("/realizar", name="venta_realizar")
     */
    public function venta_realizar(Request $request, UsuarioRepository $ur, InmuebleRepository $ir, EntityManagerInterface $em, Status1Repository $st1): Response
    {   
        //crear un nuevo registro de venta
        if (isset($request)) {
            $venta = new Venta();
            $user = $ur->find($request->request->get('idusr'));
            $propietario = $ur->find($request->request->get('idpropietario'));
            $inmueble = $ir->find($request->request->get('idinmueble'));
            $venta->setUsuario($user);
            $venta->setPropietario($propietario);
            $venta->setInmueble($inmueble);
            $venta->setFechaventa(new \DateTime($request->request->get('fecha_venta')));
            $venta->setReserva($request->request->get('reserva'));
            $venta->setIva($request->request->get('iva'));
            $venta->setTotal($request->request->get('total'));

            try {
                $em->persist($venta);
                $em->flush(); 
             } catch (\Exception $ex) {
                 //$ex->getMessage();
                 //$ex->getCode();
                 //$ex->getTraceAsString();
                 $this->addFlash('error al comprar el inmueble', $ex->getMessage());
                 return $this->redirectToRoute('inmueble_index_comercializacion_disponibles', [
                     'controller_name' => 'VentaController',
                 ]);
             } 


            //cambiar el estado del inmueble a vendido (4)
            $status1 = $st1->find(4);
            $inmueble->setStatus1($status1);
             try {
                $em->persist($inmueble);
                $em->flush(); 
             } catch (\Exception $ex) {
                 //$ex->getMessage();
                 //$ex->getCode();
                 //$ex->getTraceAsString();
                 $this->addFlash('error al cambiar el estado del inmueble a vendido', $ex->getMessage());
                 return $this->redirectToRoute('inmueble_index_comercializacion_disponibles', [
                     'controller_name' => 'VentaController',
                 ]);
             }

            //mensaje de si s ha tramitado.
            $this->addFlash('success', 'Venta tramitada.');
        }
       
        return $this->redirectToRoute('inmueble_index_comercializacion_disponibles', 
                                     [ 'controller_name' => 'VentaController' ]);
    }
}
