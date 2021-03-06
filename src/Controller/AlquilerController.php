<?php

namespace App\Controller;

use App\Entity\Alquiler;
use App\Repository\AlquilerRepository;
use App\Repository\InmuebleRepository;
use App\Repository\Status1Repository;
use App\Repository\UsuarioRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;


/**
 * @Route("/alquiler")
 */
class AlquilerController extends AbstractController
{
    /**
     * @Route("/index", name="alquiler_index")
     */
    public function index(AlquilerRepository $ar, Security $security): Response
    {   
        $todos_los_alquileres = $ar->findAll();
        $alquileres= array();

        //ROLE_ADMIN puede ver todos los alquileres
        if($security->isGranted('ROLE_ADMIN')){
            $alquileres = $todos_los_alquileres;
        }

        //ROLE_VENDEDOR puede ver solo sus alquileres (d los inmuebles q es propietario).
        if($security->isGranted('ROLE_VENDEDOR')){
            $misalquileres = array();
            foreach($todos_los_alquileres as $alquiler) {
                if($this->getUser() === $alquiler->getInmueble()->getUsuario())
                $misalquileres[] = $alquiler;
            }
            $alquileres = $misalquileres;
        } 

       
        return $this->render('alquiler/index.html.twig', [
            'controller_name' => 'AlquilerController',
            'alquileres' => $alquileres
        ]);
    }

    /**
     * @Route("/form_alquiler/{id}", name="form_alquiler", requirements={"id"="\d+"} )
     */
    public function form_alquiler($id, InmuebleRepository $ir): Response
    {
        $inmueble  = $ir->find($id);

        //comprobar si existe el inmueble
        if(!$inmueble){
            throw $this->createNotFoundException('Este Inmueble no existe'); 
        }
       
        $user = $this->getUser();

        return $this->render('alquiler/form_alquiler.html.twig', [
            'controller_name' => 'AlquilerController',
            'inmueble' => $inmueble,
            'user' => $user,
        ]);
    }

    /**
     * @Route("/iniciar", name="alquiler_iniciar")
     */
    public function alquiler_iniciar(Request $request, UsuarioRepository $ur, InmuebleRepository $ir, EntityManagerInterface $em, Status1Repository $st1): Response
    {
        //crear un nuevo registro de alquiler;
        if(isset($request)){
            $alquiler = new Alquiler();
            $usuario = $ur->find($request->request->get('idusr'));
            $inmueble = $ir->find($request->request->get('idinmueble'));
            $alquiler->setUsuario($usuario);
            $alquiler->setInmueble($inmueble);
            $alquiler->setImporte($request->request->get('precio'));
            $alquiler->setFechainicio(new \DateTime($request->request->get('fecha_inicio')));
            $alquiler->setFechafin(new \DateTime($request->request->get('fecha_fin')));
            $alquiler->setFianza($request->request->get('fianza'));
            
            try {
                $em->persist($alquiler);
                $em->flush(); 
             } catch (\Exception $ex) {
                 //$ex->getMessage();
                 //$ex->getCode();
                 //$ex->getTraceAsString();
                 $this->addFlash('error al alquilar el inmueble', $ex->getMessage());
                 return $this->redirectToRoute('inmueble_index_comercializacion_disponibles', [
                     'controller_name' => 'AlquilerController',
                 ]);
             }
             
             //cambiar el estado del inmueble a alquilado (3)
             $status1 = $st1->find(3);
             $inmueble->setStatus1($status1);
             try {
                $em->persist($inmueble);
                $em->flush(); 
             } catch (\Exception $ex) {
                 //$ex->getMessage();
                 //$ex->getCode();
                 //$ex->getTraceAsString();
                 $this->addFlash('error al cambiar el estado del inmueble a alquilado', $ex->getMessage());
                 return $this->redirectToRoute('inmueble_index_comercializacion_disponibles', [
                     'controller_name' => 'AlquilerController',
                 ]);
             }

            //mensaje de si s ha tramitado.
            $this->addFlash('success', 'Alquiler tramitado.');
        }

        return $this->redirectToRoute('inmueble_index_comercializacion_disponibles', 
                                     [ 'controller_name' => 'InmuebleController']);
    }
}
