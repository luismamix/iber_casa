<?php

namespace App\Controller;

use App\Entity\Cartera;
use App\Form\CarteraType;
use App\Repository\CarteraRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/cartera")
 */
class CarteraController extends AbstractController
{
    /**
     * @Route("/", name="cartera_index", methods={"GET"})
     */
    public function index(CarteraRepository $carteraRepository): Response
    {
        return $this->render('cartera/index.html.twig', [
            'carteras' => $carteraRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="cartera_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $cartera = new Cartera();
        $form = $this->createForm(CarteraType::class, $cartera);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($cartera);
            $entityManager->flush();

            return $this->redirectToRoute('cartera_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('cartera/new.html.twig', [
            'cartera' => $cartera,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="cartera_show", methods={"GET"})
     */
    public function show(Cartera $cartera): Response
    {
        return $this->render('cartera/show.html.twig', [
            'cartera' => $cartera,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="cartera_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Cartera $cartera): Response
    {
        $form = $this->createForm(CarteraType::class, $cartera);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('cartera_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('cartera/edit.html.twig', [
            'cartera' => $cartera,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="cartera_delete", methods={"POST"})
     */
    public function delete(Request $request, Cartera $cartera): Response
    {
        if ($this->isCsrfTokenValid('delete'.$cartera->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($cartera);
            $entityManager->flush();
        }

        return $this->redirectToRoute('cartera_index', [], Response::HTTP_SEE_OTHER);
    }
}
