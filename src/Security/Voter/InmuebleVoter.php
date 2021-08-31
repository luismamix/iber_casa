<?php

namespace App\Security\Voter;

use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Authorization\Voter\Voter;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\Security;

class InmuebleVoter extends Voter
{   
    private $security;

    public function __construct(Security $security)
    {
        $this->security = $security;
    }
    
    protected function supports(string $attribute, $subject): bool
    {
        // replace with your own logic
        // https://symfony.com/doc/current/security/voters.html
        return in_array($attribute, ['show', 'edit', 'delete'])
            && $subject instanceof \App\Entity\Inmueble;
    }

    protected function voteOnAttribute(string $attribute, $subject, TokenInterface $token): bool
    {   
        $user = $token->getUser();
        $inmueble = $subject;

        //## OJO RETURNS EN CADENA. ##  
        
        // if the user is anonymous, do not grant access
        if (!$user instanceof UserInterface) {
            return false;
        }

        //si es ROLE_ADMIN tiene todos los permisos
        if($this->security->isGranted('ROLE_ADMIN')){
            return true;
        }

        // ... (check conditions and return true to grant permission) ...
        switch ($attribute) {
            case 'show':
                // logic to determine if the user can VIEW
                //los compradores pueden ver los detalles del inmueble.
                if($this->security->isGranted('ROLE_COMPRADOR')){
                    return true;
                }
                //los vendedores pueden ver los detalles SI HAN CREADO EL OBJETO.
                if($this->security->isGranted('ROLE_VENDEDOR')){
                    if($user === $inmueble->getUsuario()){
                        return true;
                    }
                }
                break;
            case 'edit':
                // logic to determine if the user can EDIT
                //los compradores no tienen acceso a esta ruta.
                //los vendedores pueden modificar el inmueble SI HAN CREADO EL OBJETO.
                if($this->security->isGranted('ROLE_VENDEDOR')){
                    if($user === $inmueble->getUsuario()){
                        return true;
                    }
                }
                break;
            case 'delete':
                // logic to determine if the user can DELETE
                //los compradores no tienen acceso a esta ruta.
                //los vendedores pueden borrar el inmueble  SI HAN CREADO EL OBJETO.
                if($this->security->isGranted('ROLE_VENDEDOR')){
                    if($user === $inmueble->getUsuario()){
                        return true;
                    }
                }
                break;
           
        }

        return false;
    }
}
