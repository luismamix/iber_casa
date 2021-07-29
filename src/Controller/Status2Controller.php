<?php

namespace App\Controller;

use App\Entity\Status2;
use App\Form\Status2Type;
use App\Repository\Status2Repository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/status2")
 */
class Status2Controller extends AbstractController
{
    /**
     * @Route("/", name="status2_index", methods={"GET"})
     */
    public function index(Status2Repository $status2Repository): Response
    {
        return $this->render('status2/index.html.twig', [
            'status2s' => $status2Repository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="status2_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $status2 = new Status2();
        $form = $this->createForm(Status2Type::class, $status2);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($status2);
            $entityManager->flush();

            return $this->redirectToRoute('status2_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('status2/new.html.twig', [
            'status2' => $status2,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="status2_show", methods={"GET"})
     */
    public function show(Status2 $status2): Response
    {
        return $this->render('status2/show.html.twig', [
            'status2' => $status2,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="status2_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Status2 $status2): Response
    {
        $form = $this->createForm(Status2Type::class, $status2);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('status2_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('status2/edit.html.twig', [
            'status2' => $status2,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="status2_delete", methods={"POST"})
     */
    public function delete(Request $request, Status2 $status2): Response
    {
        if ($this->isCsrfTokenValid('delete'.$status2->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($status2);
            $entityManager->flush();
        }

        return $this->redirectToRoute('status2_index', [], Response::HTTP_SEE_OTHER);
    }
}
