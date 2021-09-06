<?php

namespace App\Controller;

use App\Repository\CarteraRepository;
use App\Repository\ComercializacionRepository;
use App\Repository\InmuebleRepository;
use App\Repository\Status1Repository;
use App\Repository\Status2Repository;
use App\Repository\TipologiaRepository;
use App\Repository\UsoRepository;
use App\Services\InmuebleManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;

/**
 * @Route("/inmueble")
 */
class InmuebleController extends AbstractController
{   //listado de inmuebles para los roles ROLE_ADMIN, ROLE_VENDEDOR
    /**
     * @Route("/index/comercializacion/todos/{page}", name="inmueble_index_comercializacion_todos", requirements={"page"="\d+"}, methods={"GET","POST"})
     */
    public function listado_comercial_todos($page = 1, ComercializacionRepository $com, TipologiaRepository $tr, InmuebleRepository $ir, Request $request): Response
    {
        $comercializaciones = $com->findAll();
        $tipologias = $tr->findAll();

        //inicializar variables
        $uso = null;
        $tipologia = null;
        //$status1 siempre a null para que saque todos los inmuebles con comercializacion (disponibles, no-disponibles, alquilados, vendidos)
        $status1= null;
        $fcomercializacion = null;
        $fcampo_busqueda=null;

        //filtrar por (enviadas por GET)
        if($request->query->get('uso') != null)
            $uso= $request->query->get('uso');
        if($request->query->get('tipologia') != null)
            $tipologia=$request->query->get('tipologia');

        if($request->query->get('ftipologia') != null)
            $tipologia=$request->query->get('ftipologia');
        if($request->query->get('fcomercializacion') != null)
            $fcomercializacion = $request->query->get('fcomercializacion');
        if($request->query->get('fcampo_busqueda') != null)
            $fcampo_busqueda = $request->query->get('fcampo_busqueda');

        //filtrar por (enviadas por POST)
        if($request->request->get('ftipologia') != null)
            $tipologia=$request->request->get('ftipologia');
        if($request->request->get('fcomercializacion') != null)
            $fcomercializacion = $request->request->get('fcomercializacion');
        if($request->request->get('fcampo_busqueda') !=null)
            $fcampo_busqueda = $request->request->get('fcampo_busqueda');

        //sacar el total de inmuebles aplicando el filtro, devuelve un entero
        $totalinmuebles = $ir->findBy_CUSTOM($uso, $tipologia, $status1, $fcomercializacion, $fcampo_busqueda);
        $numTotalPaginas=0;
        if($totalinmuebles % 10 == 0)
            $numTotalPaginas = intdiv($totalinmuebles,10);
        else
            $numTotalPaginas =intdiv($totalinmuebles,10) + 1;

        
        //resultado paginado
        $inmuebles = $ir->findBy_CUSTOM_Paginado($page, $uso, $tipologia, $status1, $fcomercializacion, $fcampo_busqueda);
        //dump($request);

        return $this->render('inmueble/index.html.twig', [
            'controller_name' => 'InmuebleController',
            'comercializaciones' => $comercializaciones,
            'tipologias' =>$tipologias,
            'inmuebles' => $inmuebles,
            'page' => $page,
            'uso' => $uso,
            'tipologia' => $tipologia,
            'fcomercializacion' => $fcomercializacion,
            'fcampo_busqueda' => $fcampo_busqueda,
            'numTotalPaginas' => $numTotalPaginas,
            'totalinmuebles' => $totalinmuebles
        ]);
    }
    
    //listado de inmuebles para los usr con rol ROLE_COMPRADOR
    /**
     * @Route("/index/comercializacion/disponibles/{page}", name="inmueble_index_comercializacion_disponibles", requirements={"page"="\d+"}, methods={"GET","POST"})
     */
    public function listado_comercial_disponibles($page = 1, ComercializacionRepository $com, TipologiaRepository $tr, InmuebleRepository $ir, Request $request): Response
    {
        $comercializaciones = $com->findAll();
        $tipologias = $tr->findAll();

        //inicializar variables
        $uso = null;
        $tipologia = null;
        //status1 siempre valdrá 1, solo se listarán inmuebles de comercializacion (disponibles).
        $status1= 1;
        $fcomercializacion = null;
        $fcampo_busqueda=null;

        //filtrar por (enviadas por GET)
        if($request->query->get('uso') != null)
            $uso= $request->query->get('uso');
        if($request->query->get('tipologia') != null)
            $tipologia=$request->query->get('tipologia');

        if($request->query->get('ftipologia') != null)
            $tipologia=$request->query->get('ftipologia');
        if($request->query->get('fcomercializacion') != null)
            $fcomercializacion = $request->query->get('fcomercializacion');
        if($request->query->get('fcampo_busqueda') != null)
            $fcampo_busqueda = $request->query->get('fcampo_busqueda');

        //filtrar por (enviadas por POST)
        if($request->request->get('ftipologia') != null)
            $tipologia=$request->request->get('ftipologia');
        if($request->request->get('fcomercializacion') != null)
            $fcomercializacion = $request->request->get('fcomercializacion');
        if($request->request->get('fcampo_busqueda') !=null)
            $fcampo_busqueda = $request->request->get('fcampo_busqueda');

        //sacar el total de inmuebles aplicando el filtro, devuelve un entero
        $totalinmuebles = $ir->findBy_CUSTOM($uso, $tipologia, $status1, $fcomercializacion, $fcampo_busqueda);
        $numTotalPaginas=0;
        if($totalinmuebles % 10 == 0)
            $numTotalPaginas = intdiv($totalinmuebles,10);
        else
            $numTotalPaginas =intdiv($totalinmuebles,10) + 1;

        
        //resultado paginado
        $inmuebles = $ir->findBy_CUSTOM_Paginado($page, $uso, $tipologia, $status1, $fcomercializacion, $fcampo_busqueda);
        //dump($request);

        return $this->render('inmueble/index.html.twig', [
            'controller_name' => 'InmuebleController',
            'comercializaciones' => $comercializaciones,
            'tipologias' =>$tipologias,
            'inmuebles' => $inmuebles,
            'page' => $page,
            'uso' => $uso,
            'tipologia' => $tipologia,
            'fcomercializacion' => $fcomercializacion,
            'fcampo_busqueda' => $fcampo_busqueda,
            'numTotalPaginas' => $numTotalPaginas,
            'totalinmuebles' => $totalinmuebles
        ]);
    }

    /**
     * @Route("/show/{id}", name="mostrar_inmueble", requirements={"id"="\d+"})
     */
    public function mostrar_inmueble($id, InmuebleRepository $ir): Response
    {
        $inmueble = $ir->find($id);
        //comprobar si existe el inmueble
        if(!$inmueble){
            throw $this->createNotFoundException('Este Inmueble no existe'); 
        }

        //checkear el acceso a la ruta mostrar_inmueble
        $this->denyAccessUnlessGranted("show",$inmueble);

        return $this->render('inmueble/ver_detalles_inmueble.html.twig', [
            'controller_name' => 'InmuebleController',
            'inmueble' => $inmueble
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
        Status1Repository $s1r,
        Status2Repository $s2r,
        ComercializacionRepository $com,
        UsoRepository $ur
    ): Response {
        //PTE: optimizar el findAll de todos.
        $tipologia_id=$request->request->get('tipologia');
        $tipologia = $tr->find($tipologia_id);
        $carteras = $cr->findAll();
        $status1 = $s1r->findAll();
        $status2 = $s2r->findAll();
        $comercializaciones = $com->findAll();
        $usos = $ur->findAll();


        return $this->render('inmueble/form_nuevo.html.twig', [
            'controller_name' => 'InmuebleController',
            'tipologia' => $tipologia,
            'carteras' => $carteras,
            'status1' => $status1,
            'status2' => $status2,
            'comercializaciones' => $comercializaciones,
            'usos' => $usos

        ]);
    }

    /**
     * @Route("/new/nuevo_inmueble", name="nuevo_inmueble")
     */
    public function nuevo_inmueble(Request $request, InmuebleManager $im): Response
    {
        //recuperar datos del formulario :O
        $datosform =[];
        $rutaProyecto="";
        $user = $this->getUser();
        //dump($request);

        if ($request->request->get('tipologia') != null) {
            $datosform['tipologia']=$request->request->get('tipologia');
        }
        if ($request->request->get('cartera') != null) {
            $datosform['cartera']=$request->request->get('cartera');
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
        if ($request->request->get('descripcion') != null) {
            $datosform['descripcion']=$request->request->get('descripcion');
        }
        if ($request->request->get('terrazas') != null) {
            $datosform['terrazas']=$request->request->get('terrazas');
        }

        //dump($datosform);
        
        //llamar al servicio q se encarga de crear, modificar,borrar inmuebles.
        try {
            $inmueble =$im->crearInmueble($datosform, $rutaProyecto, $user);
            $inmueble->getId();
        } catch (\Exception $ex) {
           /*  $ex->getMessage();
            $ex->getCode();
            $ex->getTraceAsString(); */
            $this->addFlash('error al crear inmueble', $ex->getMessage());
            return $this->render('public/index.html.twig', [
                'controller_name' => 'InmuebleController',
            ]);
        }

        //mensaje de si s ha creado.
        $this->addFlash('success', 'Inmueble creado.');

        //redireccionar
        return $this->redirectToRoute('inmueble_index_comercializacion_todos', [
            'controller_name' => 'InmuebleController',
        ]);
    }

    /**
     * @Route("/edit/form_modificar_inmueble/{id}", name="form_modificar_inmueble", requirements={"id"="\d+"})
     */
    public function form_modificar_inmueble(
        $id,
        InmuebleRepository $im,
        TipologiaRepository $tr,
        CarteraRepository $cr,
        Status1Repository $s1r,
        Status2Repository $s2r,
        ComercializacionRepository $com,
        UsoRepository $ur
    ): Response {
        
        $inmueble  = $im->find($id);
        
        //comprobar si existe el inmueble
        if(!$inmueble){
            throw $this->createNotFoundException('Este Inmueble no existe'); 
        }
        
        //checkear el acceso a la ruta form_modificar_inmueble
        $this->denyAccessUnlessGranted("edit",$inmueble);

        $tipologias = $tr->findAll();
        $carteras = $cr->findAll();
        $status1 = $s1r->findAll();
        $status2 = $s2r->findAll();
        $comercializaciones = $com->findAll();
        $usos = $ur->findAll();

        return $this->render('inmueble/form_modificar_inmueble.html.twig', [
            'controller_name' => 'InmuebleController',
            'inmueble' => $inmueble,
            'tipologias' => $tipologias,
            'carteras' => $carteras,
            'status1' => $status1,
            'status2' => $status2,
            'comercializaciones' => $comercializaciones,
            'usos' => $usos
        ]);
    }

    /**
     * @Route("/edit/modificar_inmueble", name="modificar_inmueble")
     */
    public function modificar_inmueble(
        Request $request,
        InmuebleManager $im
    ): Response {
        //recuperar datos del formulario :O
        $datosform =[];
        $rutaProyecto="";
        //dump($request);

        if ($request->request->get('id') != null) {
            $datosform['id']=$request->request->get('id');
        }
        if ($request->request->get('tipologia') != null) {
            $datosform['tipologia']=$request->request->get('tipologia');
        }
        if ($request->request->get('cartera') != null) {
            $datosform['cartera']=$request->request->get('cartera');
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
        if ($request->request->get('descripcion') != null) {
            $datosform['descripcion']=$request->request->get('descripcion');
        }
        if ($request->request->get('terrazas') != null) {
            $datosform['terrazas']=$request->request->get('terrazas');
        }

        //dump($datosform);
        
        //llamar al servicio q se encarga de crear, modificar,borrar inmuebles.
        try {
            $inmueble =$im->modificarInmueble($datosform, $rutaProyecto);
            $inmueble->getId();
        } catch (\Exception $ex) {
            //$ex->getMessage();
            //$ex->getCode();
            //$ex->getTraceAsString();
            $this->addFlash('error al modificar el inmueble', $ex->getMessage());
            return $this->redirectToRoute('inmueble_index_comercializacion_todos', [
                'controller_name' => 'InmuebleController',
            ]);
        }
        
        //mensaje de si s ha modificado.
        $this->addFlash('success', 'Inmueble modificado.');

        return $this->redirectToRoute('inmueble_index_comercializacion_todos', [
            'controller_name' => 'InmuebleController',
        ]);
    }

    /**
     * @Route("/delete/{id}", name="eliminar_inmueble", requirements={"id"="\d+"})
     */
    public function eliminar_inmueble($id, InmuebleRepository $ir, InmuebleManager $im): Response
    {
        $inmueble = $ir->find($id);

        //comprobar si existe el inmueble
        if(!$inmueble){
            throw $this->createNotFoundException('Este Inmueble no existe'); 
        }

        //checkear el acceso a la ruta eliminar_inmueble
        $this->denyAccessUnlessGranted("delete",$inmueble);

        try {
            $im->borrarInmueble($inmueble);
        } catch (\Exception $ex) {
            //$ex->getMessage();
            //$ex->getCode();
            //$ex->getTraceAsString();
            $this->addFlash('error al borrar el inmueble', $ex->getMessage());
            return $this->redirectToRoute('inmueble_index_comercializacion_todos', [
                'controller_name' => 'InmuebleController',
            ]);
        }

        //mensaje de si s ha borrado.
        $this->addFlash('success', 'Inmueble borrado.');

        return $this->redirectToRoute('inmueble_index_comercializacion_todos', [
            'controller_name' => 'InmuebleController',
        ]);
    }
}
