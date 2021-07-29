<?php

namespace App\Controller;

use App\Entity\Propietario;
use App\Form\PropietarioType;
use App\Repository\PropietarioRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/propietario")
 */
class PropietarioController extends AbstractController
{
    /**
     * @Route("/", name="propietario_index", methods={"GET"})
     */
    public function index(PropietarioRepository $propietarioRepository): Response
    {
        return $this->render('propietario/index.html.twig', [
            'propietarios' => $propietarioRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="propietario_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $propietario = new Propietario();
        $form = $this->createForm(PropietarioType::class, $propietario);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($propietario);
            $entityManager->flush();

            return $this->redirectToRoute('propietario_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('propietario/new.html.twig', [
            'propietario' => $propietario,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="propietario_show", methods={"GET"})
     */
    public function show(Propietario $propietario): Response
    {
        return $this->render('propietario/show.html.twig', [
            'propietario' => $propietario,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="propietario_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Propietario $propietario): Response
    {
        $form = $this->createForm(PropietarioType::class, $propietario);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('propietario_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('propietario/edit.html.twig', [
            'propietario' => $propietario,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="propietario_delete", methods={"POST"})
     */
    public function delete(Request $request, Propietario $propietario): Response
    {
        if ($this->isCsrfTokenValid('delete'.$propietario->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($propietario);
            $entityManager->flush();
        }

        return $this->redirectToRoute('propietario_index', [], Response::HTTP_SEE_OTHER);
    }
}
