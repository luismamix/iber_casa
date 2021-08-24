<?php

namespace App\Controller;

use App\Entity\Usuario;
use App\Repository\TipoUsuarioRepository;
use App\Form\RegistrationFormType;
use App\Form\RegistrationForm2Type;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class RegistrationController extends AbstractController
{
    /**
     * @Route("/register/{tipo}", name="app_register", requirements={"page"="\d+"})
     */
    public function register($tipo=1, Request $request, UserPasswordEncoderInterface $passwordEncoder, TipoUsuarioRepository $tu): Response
    {  
        $user = new Usuario();
        $form = null;

        //elegir el tipoformulario q s construira
         switch ($tipo) {
            case 1:
                //form reg tipo admin
                $form = $this->createForm(RegistrationFormType::class, $user);
                break;
            case 2:
            case 3:
                 //form reg tipo vendedor, comprador
                $form = $this->createForm(RegistrationForm2Type::class, $user);
                break;
            default:
                # code...
                break;
        }

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
            
            //setear el rol
            switch ($tipo) {
                case 1:
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
                    break;
                case 2:
                    $rol = ["ROLE_VENDEDOR"];
                    $user->setRoles($rol);
                    $tipousuario = $tu->find($tipo);
                    $user->setTipousuario($tipousuario);
                    break;
                case 3:
                    $rol = ["ROLE_COMPRADOR"];
                    $user->setRoles($rol);
                    $tipousuario = $tu->find($tipo);
                    $user->setTipousuario($tipousuario);
                    break;
                default:
                    # code...
                    break;
            }
            
            //comun
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($user);
            $entityManager->flush();
            //mensaje de si s ha creado.
            $this->addFlash('success', 'Usuario creado.');
            
            return $this->redirectToRoute('index');
        }

        //elegir la plantilla q s mostrara.
        switch ($tipo) {
            case 1:
                return $this->render('registration/register.html.twig', [
                    'registrationForm' => $form->createView(),
                ]);
                break;
            case 2:
            case 3:
                return $this->render('registration/register2.html.twig', [
                    'registrationForm' => $form->createView(),
                ]);
                break;
            default:
                # code...
                break;
        }
        
    }
}
