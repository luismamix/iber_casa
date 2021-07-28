<?php

namespace App\Controller;

use App\Entity\Usuario;
use App\Repository\TipoUsuarioRepository;
use App\Form\RegistrationFormType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class RegistrationController extends AbstractController
{
    /**
     * @Route("/register", name="app_register")
     */
    public function register(Request $request, UserPasswordEncoderInterface $passwordEncoder, TipoUsuarioRepository $tu): Response
    {  
        $user = new Usuario();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // mapear los datos del formulario
            $user->setPassword(
                $passwordEncoder->encodePassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );
            
            $user->setEmail($form->get('email')->getData());
            $user->setNombre($form->get('nombre')->getData());
            $user->setApellido($form->get('apellido')->getData());
            $user->setDireccion($form->get('direccion')->getData());
            $user->setTelefono((int)$form->get('telefono')->getData());
            
            //el tipousr del form vale para setear el campo roles y el campo tipousuario del user.
            $campo_tipousr = $form->get('tipousr')->getData();
            $rol=[];
            switch ($campo_tipousr) {
                case 1:
                    $rol = ["ROLE_ADMIN"];
                    break;
                case 2:
                    $rol = ["ROLE_VENDEDOR"];
                    break;
                case 3:
                    $rol = ["ROLE_COMPRADOR"];
                        break;
                default:
                    # code...
                    break;
            }
            $user->setRoles($rol);
            $tipousuario = $tu->find($campo_tipousr);
            $user->setTipousuario($tipousuario);
            
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($user);
            $entityManager->flush();
            // do anything else you need here, like send an email
            return $this->redirectToRoute('index');
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
        ]);
    }
}
