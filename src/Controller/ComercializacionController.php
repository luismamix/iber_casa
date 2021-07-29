<?php

namespace App\Controller;

use App\Entity\Comercializacion;
use App\Form\ComercializacionType;
use App\Repository\ComercializacionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/comercializacion")
 */
class ComercializacionController extends AbstractController
{
    /**
     * @Route("/", name="comercializacion_index", methods={"GET"})
     */
    public function index(ComercializacionRepository $comercializacionRepository): Response
    {
        return $this->render('comercializacion/index.html.twig', [
            'comercializacions' => $comercializacionRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="comercializacion_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $comercializacion = new Comercializacion();
        $form = $this->createForm(ComercializacionType::class, $comercializacion);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($comercializacion);
            $entityManager->flush();

            return $this->redirectToRoute('comercializacion_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('comercializacion/new.html.twig', [
            'comercializacion' => $comercializacion,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="comercializacion_show", methods={"GET"})
     */
    public function show(Comercializacion $comercializacion): Response
    {
        return $this->render('comercializacion/show.html.twig', [
            'comercializacion' => $comercializacion,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="comercializacion_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Comercializacion $comercializacion): Response
    {
        $form = $this->createForm(ComercializacionType::class, $comercializacion);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('comercializacion_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('comercializacion/edit.html.twig', [
            'comercializacion' => $comercializacion,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="comercializacion_delete", methods={"POST"})
     */
    public function delete(Request $request, Comercializacion $comercializacion): Response
    {
        if ($this->isCsrfTokenValid('delete'.$comercializacion->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($comercializacion);
            $entityManager->flush();
        }

        return $this->redirectToRoute('comercializacion_index', [], Response::HTTP_SEE_OTHER);
    }
}
