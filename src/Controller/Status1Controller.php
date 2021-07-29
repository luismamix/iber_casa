<?php

namespace App\Controller;

use App\Entity\Status1;
use App\Form\Status1Type;
use App\Repository\Status1Repository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/status1")
 */
class Status1Controller extends AbstractController
{
    /**
     * @Route("/", name="status1_index", methods={"GET"})
     */
    public function index(Status1Repository $status1Repository): Response
    {
        return $this->render('status1/index.html.twig', [
            'status1s' => $status1Repository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="status1_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $status1 = new Status1();
        $form = $this->createForm(Status1Type::class, $status1);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($status1);
            $entityManager->flush();

            return $this->redirectToRoute('status1_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('status1/new.html.twig', [
            'status1' => $status1,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="status1_show", methods={"GET"})
     */
    public function show(Status1 $status1): Response
    {
        return $this->render('status1/show.html.twig', [
            'status1' => $status1,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="status1_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Status1 $status1): Response
    {
        $form = $this->createForm(Status1Type::class, $status1);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('status1_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('status1/edit.html.twig', [
            'status1' => $status1,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="status1_delete", methods={"POST"})
     */
    public function delete(Request $request, Status1 $status1): Response
    {
        if ($this->isCsrfTokenValid('delete'.$status1->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($status1);
            $entityManager->flush();
        }

        return $this->redirectToRoute('status1_index', [], Response::HTTP_SEE_OTHER);
    }
}
