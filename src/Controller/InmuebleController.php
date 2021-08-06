<?php

namespace App\Controller;

use App\Repository\CarteraRepository;
use App\Repository\ComercializacionRepository;
use App\Repository\PropietarioRepository;
use App\Repository\Status1Repository;
use App\Repository\Status2Repository;
use App\Repository\TipologiaRepository;
use App\Repository\UsoRepository;
use App\Services\InmuebleManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

/**
 * @Route("/inmueble")
 */
class InmuebleController extends AbstractController
{
    /**
     * @Route("/index", name="inmueble_index")
     */
    public function index( ComercializacionRepository $com, TipologiaRepository $tr, Request $request): Response
    {
        $comercializaciones = $com->findAll();
        $tipologias = $tr->findAll();
        dump($request);

        return $this->render('inmueble/index.html.twig', [
            'controller_name' => 'InmuebleController',
            'comercializaciones' => $comercializaciones,
            'tipologias' =>$tipologias
        ]);
    }

    /**
     * @Route("/new/form_elegir_tipologia", name="form_elegir_tipologia")
     */
    public function form_elegir_tipologia(TipologiaRepository $tr): Response
    {
        $tipologias = $tr->findAll();

        return $this->render('inmueble/form_elegir_tipologia.html.twig', [
            'controller_name' => 'InmuebleController',
            'tipologias' => $tipologias
        ]);
    }

    /**
     * @Route("/new/form_nuevo_inmueble", name="form_nuevo_inmueble")
     */
    public function form_nuevo_inmueble(
        Request $request,
        TipologiaRepository $tr,
        CarteraRepository $cr,
        PropietarioRepository $pr,
        Status1Repository $s1r,
        Status2Repository $s2r,
        ComercializacionRepository $com,
        UsoRepository $ur
    ): Response {
        //PTE: optimizar el findAll de todos.
        $tipologia_id=$request->request->get('tipologia');
        $tipologia = $tr->find($tipologia_id);
        $carteras = $cr->findAll();
        $propietarios = $pr->findAll();
        $status1 = $s1r->findAll();
        $status2 = $s2r->findAll();
        $comercializaciones = $com->findAll();
        $usos = $ur->findAll();


        return $this->render('inmueble/form_nuevo.html.twig', [
            'controller_name' => 'InmuebleController',
            'tipologia' => $tipologia,
            'carteras' => $carteras,
            'propietarios' => $propietarios,
            'status1' => $status1,
            'status2' => $status2,
            'comercializaciones' => $comercializaciones,
            'usos' => $usos

        ]);
    }

    /**
     * @Route("/new/nuevo_inmueble", name="nuevo_inmueble")
     */
    public function nuevo_inmueble(Request $request, 
                                   InmuebleManager $im, 
                                   TipologiaRepository $tr,
                                   CarteraRepository $ca, 
                                   PropietarioRepository $pro,
                                   Status1Repository $st1,
                                   Status2Repository $st2,
                                   UsoRepository $uso,
                                   ComercializacionRepository $com ): Response
    {
        //recuperar datos del formulario :O
        $datosform =[];
        $rutaProyecto="";
        dump($request);

        if ($request->request->get('tipologia') != null) {
            $datosform['tipologia']=$request->request->get('tipologia');
        }
        if ($request->request->get('cartera') != null) {
            $datosform['cartera']=$request->request->get('cartera');
        }
        if ($request->request->get('propietario') != null) {
            $datosform['propietario']=$request->request->get('propietario');
        }
        if ($request->request->get('status1') != null) {
            $datosform['status1']=$request->request->get('status1');
        }
        if ($request->request->get('status2') != null) {
            $datosform['status2']=$request->request->get('status2');
        }
        if ($request->request->get('uso') != null) {
            $datosform['uso']=$request->request->get('uso');
        }
        if ($request->request->get('comercializacion') != null) {
            $datosform['comercializacion']=$request->request->get('comercializacion');
        }
        // los campos tipo file  se obtienen del $request->files->get('rutaimagen')
        // OJO el $request->files->get('rutaimagen') devuelve un array con los ficheros seleccionados.
        if ($request->files->get('rutaimagen') != null) {
            $datosform['rutaimagenes'] = $request->files->get('rutaimagen');
            
            //obtener la ruta del proyecto
            $rutaProyecto = $this->getParameter('kernel.project_dir');
        }
        if ($request->request->get('precio') != null) {
            $datosform['precio']=$request->request->get('precio');
        }
        if ($request->request->get('direccion') != null) {
            $datosform['direccion']=$request->request->get('direccion');
        }
        if ($request->request->get('localidad') != null) {
            $datosform['localidad']=$request->request->get('localidad');
        }
        if ($request->request->get('provincia') != null) {
            $datosform['provincia']=$request->request->get('provincia');
        }
        if ($request->request->get('m2construido') != null) {
            $datosform['m2construido']=$request->request->get('m2construido');
        }
        if ($request->request->get('anoconstruccion') != null) {
            $datosform['anoconstruccion']=$request->request->get('anoconstruccion');
        }
        if ($request->request->get('plantas') != null) {
            $datosform['plantas']=$request->request->get('plantas');
        }
        if ($request->request->get('banos') != null) {
            $datosform['banos']=$request->request->get('banos');
        }
        if ($request->request->get('licactividad') != null) {
            $datosform['licactividad']=$request->request->get('licactividad');
        }
        if ($request->request->get('certenergetico') != null) {
            $datosform['certenergetico']=$request->request->get('certenergetico');
        }
        if ($request->request->get('m2parcela') != null) {
            $datosform['m2parcela']=$request->request->get('m2parcela');
        }
        if ($request->request->get('cocina') != null) {
            $datosform['cocina']=$request->request->get('cocina');
        }
        if ($request->request->get('aireacondicionado') != null) {
            $datosform['aireacondicionado']=$request->request->get('aireacondicionado');
        }
        if ($request->request->get('calefaccion') != null) {
            $datosform['calefaccion']=$request->request->get('calefaccion');
        }
        if ($request->request->get('dormitorios') != null) {
            $datosform['dormitorios']=$request->request->get('dormitorios');
        }
        if ($request->request->get('garaje') != null) {
            $datosform['garaje']=$request->request->get('garaje');
        }
        if ($request->request->get('piscina') != null) {
            $datosform['piscina']=$request->request->get('piscina');
        }
        if ($request->request->get('ascensor') != null) {
            $datosform['ascensor']=$request->request->get('ascensor');
        }
        if ($request->request->get('trastero') != null) {
            $datosform['trastero']=$request->request->get('trastero');
        }
        if ($request->request->get('buhardilla') != null) {
            $datosform['buhardilla']=$request->request->get('buhardilla');
        }
        if ($request->request->get('m2superficie') != null) {
            $datosform['m2superficie']=$request->request->get('m2superficie');
        }
        if ($request->request->get('suministroagua') != null) {
            $datosform['suministroagua']=$request->request->get('suministroagua');
        }
        if ($request->request->get('suministroelectricidad') != null) {
            $datosform['suministroelectricidad']=$request->request->get('suministroelectricidad');
        }
        if ($request->request->get('pozo') != null) {
            $datosform['pozo']=$request->request->get('pozo');
        }
        if ($request->request->get('aperos') != null) {
            $datosform['aperos']=$request->request->get('aperos');
        }
        if ($request->request->get('salas') != null) {
            $datosform['salas']=$request->request->get('salas');
        }
        if ($request->request->get('porcentajeconstruido') != null) {
            $datosform['porcentajeconstruido']=$request->request->get('porcentajeconstruido');
        }

        //dump($datosform);
        
        //llamar al servicio q se encarga de crear, modificar,borrar inmuebles.
        try {
            $inmueble =$im->crearInmueble($datosform, $tr, $ca, $pro, $st1, $st2, $uso, $com, $rutaProyecto);
            $inmueble->getId();
        } catch(\Exception $ex) {
            //$ex->getMessage();
            //$ex->getCode();
            //$ex->getTraceAsString();
            $this->addFlash('error al crear inmueble', $ex->getMessage());
            return $this->render('public/index.html.twig', [
                'controller_name' => 'InmuebleController',
            ]);
        }

        //mensaje de si s ha creado.
        $this->addFlash('success', 'Inmueble creado.');

        //redireccionar 
        return $this->render('public/index.html.twig', [
            'controller_name' => 'InmuebleController',
        ]);
    }
}
