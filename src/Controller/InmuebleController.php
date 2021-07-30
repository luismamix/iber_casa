<?php

namespace App\Controller;


use App\Repository\CarteraRepository;
use App\Repository\ComercializacionRepository;
use App\Repository\PropietarioRepository;
use App\Repository\Status1Repository;
use App\Repository\Status2Repository;
use App\Repository\TipologiaRepository;
use App\Repository\UsoRepository;
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
     * @Route("/", name="inmueble_index")
     */
    public function index(): Response
    {
        return $this->render('inmueble/index.html.twig', [
            'controller_name' => 'InmuebleController',
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
    public function form_nuevo_inmueble(Request $request,
                         TipologiaRepository $tr,
                         CarteraRepository $cr,
                         PropietarioRepository $pr,
                         Status1Repository $s1r,
                         Status2Repository $s2r,
                         ComercializacionRepository $com,
                         UsoRepository $ur
                         ): Response
    {   
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
    public function nuevo_inmueble(Request $request): Response
    {
       //PTE CREATE
        dump($request);
        return $this->render('public/index.html.twig', [
            'controller_name' => 'InmuebleController',
        ]);
    }
}
