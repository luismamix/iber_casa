<?php

namespace App\Services;

use App\Entity\Inmueble;
use App\Entity\Usuario;
use App\Repository\CarteraRepository;
use App\Repository\ComercializacionRepository;
use App\Repository\InmuebleRepository;
use App\Repository\PropietarioRepository;
use App\Repository\Status1Repository;
use App\Repository\Status2Repository;
use App\Repository\TipologiaRepository;
use App\Repository\UsoRepository;
use Doctrine\ORM\EntityManagerInterface;

class InmuebleManager
{
    private $im;
    private $em;
    private $tr;
    private $ca;
    private $pro;
    private $st1;
    private $st2;
    private $uso;
    private $com;
    
    public function __construct(
        InmuebleRepository $im,
        EntityManagerInterface $em,
        TipologiaRepository $tr,
        CarteraRepository $ca,
        PropietarioRepository $pro,
        Status1Repository $st1,
        Status2Repository $st2,
        UsoRepository $uso,
        ComercializacionRepository $com
    ) {
        $this->im = $im;
        $this->em = $em;
        $this->tr = $tr;
        $this->ca = $ca;
        $this->pro= $pro;
        $this->st1 = $st1;
        $this->st2= $st2;
        $this->uso= $uso;
        $this->com = $com;
    }

    public function crearInmueble(array $datos, string $rutaProyecto, Usuario $user)
    {
        $inmueble = new Inmueble();
    
        //setear los datos recibidos
        if (isset($datos['tipologia'])) {
            $tipologia = $this->tr->find($datos['tipologia']);
            $inmueble->setTipologia($tipologia);
        }
        if (isset($datos['cartera'])) {
            $cartera = $this->ca->find($datos['cartera']);
            $inmueble->setCartera($cartera);
        }
        if (isset($datos['propietario'])) {
            $propietario = $this->pro->find($datos['propietario']);
            $inmueble->setPropietario($propietario);
        }
        if (isset($datos['status1'])) {
            $status1 = $this->st1->find($datos['status1']);
            $inmueble->setStatus1($status1);
        }
        if (isset($datos['status2'])) {
            $status2 = $this->st2->find($datos['status2']);
            $inmueble->setStatus2($status2);
        }
        if (isset($datos['comercializacion'])) {
            $comercializacion = $this->com->find($datos['comercializacion']);
            $inmueble->setComercializacion($comercializacion);
        }
        if (isset($datos['uso'])) {
            $uso = $this->uso->find($datos['uso']);
            $inmueble->setUso($uso);
        }
        if (isset($datos['rutaimagenes'])) {
            //dump($datos['rutaimagenes']);
            $cadena="";
            //variable para controlar cual es el ultimo fichero y q no ponga punto y coma.
            $i=1;
            //obtener los ficheros
            foreach ($datos['rutaimagenes'] as $file) {
                //obtener la extension del archivo
                $extension = $file->guessExtension();
                //construir nombre fichero
                $filename =  'img_'.uniqid().'.'.$extension;
                //moverlo a la ruta public/images
                $file->move($rutaProyecto.'/public/images/', $filename);
                //concatenar las rutas de los ficheros con punto y coma, y guardarlo en un string.
                if ($i < count($datos['rutaimagenes'])) {
                    $cadena .= "images/".$filename.";";
                } else {
                    $cadena .= "images/".$filename;
                }
                $i++;
            }
            $inmueble->setRutaimagen($cadena);
        }

        if (isset($datos['precio'])) {
            $inmueble->setPrecio($datos['precio']);
        }
        if (isset($datos['direccion'])) {
            $inmueble->setDireccion($datos['direccion']);
        }
        if (isset($datos['localidad'])) {
            $inmueble->setLocalidad($datos['localidad']);
        }
        if (isset($datos['provincia'])) {
            $inmueble->setProvincia($datos['provincia']);
        }
        if (isset($datos['m2construido'])) {
            $inmueble->setM2construido($datos['m2construido']);
        }
        if (isset($datos['anoconstruccion'])) {
            $inmueble->setAnoconstruccion($datos['anoconstruccion']);
        }
        if (isset($datos['plantas'])) {
            $inmueble->setPlantas($datos['plantas']);
        }
        if (isset($datos['banos'])) {
            $inmueble->setBanos($datos['banos']);
        }
        if (isset($datos['licactividad'])) {
            $inmueble->setLicactividad($datos['licactividad']);
        }
        if (isset($datos['certenergetico'])) {
            $inmueble->setCertenergetico($datos['certenergetico']);
        }
        if (isset($datos['m2parcela'])) {
            $inmueble->setM2parcela($datos['m2parcela']);
        }
        if (isset($datos['cocina'])) {
            $inmueble->setCocina($datos['cocina']);
        }
        if (isset($datos['aireacondicionado'])) {
            $inmueble->setAireacondicionado($datos['aireacondicionado']);
        }
        if (isset($datos['calefaccion'])) {
            $inmueble->setCalefaccion($datos['calefaccion']);
        }
        if (isset($datos['garaje'])) {
            $inmueble->setGaraje($datos['garaje']);
        }
        if (isset($datos['dormitorios'])) {
            $inmueble->setDormitorios($datos['dormitorios']);
        }
        if (isset($datos['piscina'])) {
            $inmueble->setPiscina($datos['piscina']);
        }
        if (isset($datos['ascensor'])) {
            $inmueble->setAscensor($datos['ascensor']);
        }
        if (isset($datos['trastero'])) {
            $inmueble->setTrastero($datos['trastero']);
        }
        if (isset($datos['buhardilla'])) {
            $inmueble->setBuhardilla($datos['buhardilla']);
        }
        if (isset($datos['m2superficie'])) {
            $inmueble->setM2superficie($datos['m2superficie']);
        }
        if (isset($datos['suministroagua'])) {
            $inmueble->setSuministroagua($datos['suministroagua']);
        }
        if (isset($datos['suministroelectricidad'])) {
            $inmueble->setSuministroelectricidad($datos['suministroelectricidad']);
        }
        if (isset($datos['pozo'])) {
            $inmueble->setPozo($datos['pozo']);
        }
        if (isset($datos['aperos'])) {
            $inmueble->setAperos($datos['aperos']);
        }
        if (isset($datos['salas'])) {
            $inmueble->setSalas($datos['salas']);
        }
        if (isset($datos['porcentajeconstruido'])) {
            $inmueble->setPorcentajeconstruido($datos['porcentajeconstruido']);
        }
        if (isset($datos['descripcion'])) {
            $inmueble->setDescripcion($datos['descripcion']);
        }
        if (isset($datos['terrazas'])) {
            $inmueble->setTerrazas($datos['terrazas']);
        }

        //usuario propietario del objeto
        $inmueble->setUsuario($user);

        //persistir y flushear
        $this->em->persist($inmueble);
        $this->em->flush();
    
        return $inmueble;
    }

    public function modificarInmueble(array $datos, string $rutaProyecto)
    {
        $inmueble=null;
        //dump($datos);

        if (isset($datos['id'])) {
            $inmueble = $this->im->find($datos['id']);
        }
       
        //setear los datos recibidos
        if (isset($datos['tipologia'])) {
            $tipologia = $this->tr->find($datos['tipologia']);
            $inmueble->setTipologia($tipologia);
        }
        if (isset($datos['cartera'])) {
            $cartera = $this->ca->find($datos['cartera']);
            $inmueble->setCartera($cartera);
        }
        if (isset($datos['propietario'])) {
            $propietario = $this->pro->find($datos['propietario']);
            $inmueble->setPropietario($propietario);
        }
        if (isset($datos['status1'])) {
            $status1 = $this->st1->find($datos['status1']);
            $inmueble->setStatus1($status1);
        }
        if (isset($datos['status2'])) {
            $status2 = $this->st2->find($datos['status2']);
            $inmueble->setStatus2($status2);
        }
        if (isset($datos['comercializacion'])) {
            $comercializacion = $this->com->find($datos['comercializacion']);
            $inmueble->setComercializacion($comercializacion);
        }
        if (isset($datos['uso'])) {
            $uso = $this->uso->find($datos['uso']);
            $inmueble->setUso($uso);
        }
        if (isset($datos['rutaimagenes'])) {
            //dump($datos['rutaimagenes']);
            $cadena="";
            //variable para controlar cual es el ultimo fichero y q no ponga punto y coma.
            $i=1;
            //obtener los ficheros
            foreach ($datos['rutaimagenes'] as $file) {
                //obtener la extension del archivo
                $extension = $file->guessExtension();
                //construir nombre fichero
                $filename =  'img_'.uniqid().'.'.$extension;
                //moverlo a la ruta public/images
                $file->move($rutaProyecto.'/public/images/', $filename);
                //concatenar las rutas de los ficheros con punto y coma, y guardarlo en un string.
                if ($i < count($datos['rutaimagenes'])) {
                    $cadena .= "images/".$filename.";";
                } else {
                    $cadena .= "images/".$filename;
                }
                $i++;
            }
            //añadir fotos al inmueble
            $rutasexistentes = $inmueble->getRutaimagen();
            if ($rutasexistentes == "" or $rutasexistentes == null) {
                $inmueble->setRutaimagen($cadena);
            } else {
                $inmueble->setRutaimagen($rutasexistentes.";".$cadena);
            }
        }

        if (isset($datos['precio'])) {
            $inmueble->setPrecio($datos['precio']);
        }
        if (isset($datos['direccion'])) {
            $inmueble->setDireccion($datos['direccion']);
        }
        if (isset($datos['localidad'])) {
            $inmueble->setLocalidad($datos['localidad']);
        }
        if (isset($datos['provincia'])) {
            $inmueble->setProvincia($datos['provincia']);
        }
        //dependiendo de la tipologia algunos de estos campos no son obligatorios.
        //al modificar algun checkbox del formulario o dejar en blanco algun campo, q no sean obligatorios,
        //la unica manera de darse cuenta es comprobar si vuelve el campo por el request, sino vuelve hay q setear
        //a null los campos no obligatorios(los q admiten null).
        if (isset($datos['m2construido'])) {
            $inmueble->setM2construido($datos['m2construido']);
        } else {
            $inmueble->setM2construido(null);
        }
        if (isset($datos['anoconstruccion'])) {
            $inmueble->setAnoconstruccion($datos['anoconstruccion']);
        }
        if (isset($datos['plantas'])) {
            $inmueble->setPlantas($datos['plantas']);
        } else {
            $inmueble->setPlantas(null);
        }
        if (isset($datos['banos'])) {
            $inmueble->setBanos($datos['banos']);
        } else {
            $inmueble->setBanos(null);
        }
        if (isset($datos['licactividad'])) {
            $inmueble->setLicactividad($datos['licactividad']);
        } else {
            $inmueble->setLicactividad(null);
        }
        if (isset($datos['certenergetico'])) {
            $inmueble->setCertenergetico($datos['certenergetico']);
        } else {
            $inmueble->setCertenergetico(null);
        }
        if (isset($datos['m2parcela'])) {
            $inmueble->setM2parcela($datos['m2parcela']);
        } else {
            $inmueble->setM2parcela(null);
        }
        if (isset($datos['cocina'])) {
            $inmueble->setCocina($datos['cocina']);
        } else {
            $inmueble->setCocina(null);
        }
        if (isset($datos['aireacondicionado'])) {
            $inmueble->setAireacondicionado($datos['aireacondicionado']);
        } else {
            $inmueble->setAireacondicionado(null);
        }
        if (isset($datos['calefaccion'])) {
            $inmueble->setCalefaccion($datos['calefaccion']);
        } else {
            $inmueble->setCalefaccion(null);
        }
        if (isset($datos['garaje'])) {
            $inmueble->setGaraje($datos['garaje']);
        } else {
            $inmueble->setGaraje(null);
        }
        if (isset($datos['dormitorios'])) {
            $inmueble->setDormitorios($datos['dormitorios']);
        } else {
            $inmueble->setDormitorios(null);
        }
        if (isset($datos['piscina'])) {
            $inmueble->setPiscina($datos['piscina']);
        } else {
            $inmueble->setPiscina(null);
        }
        if (isset($datos['ascensor'])) {
            $inmueble->setAscensor($datos['ascensor']);
        } else {
            $inmueble->setAscensor(null);
        }
        if (isset($datos['trastero'])) {
            $inmueble->setTrastero($datos['trastero']);
        } else {
            $inmueble->setTrastero(null);
        }
        if (isset($datos['buhardilla'])) {
            $inmueble->setBuhardilla($datos['buhardilla']);
        } else {
            $inmueble->setBuhardilla(null);
        }
        if (isset($datos['m2superficie'])) {
            $inmueble->setM2superficie($datos['m2superficie']);
        } else {
            $inmueble->setM2superficie(null);
        }
        if (isset($datos['suministroagua'])) {
            $inmueble->setSuministroagua($datos['suministroagua']);
        } else {
            $inmueble->setSuministroagua(null);
        }
        if (isset($datos['suministroelectricidad'])) {
            $inmueble->setSuministroelectricidad($datos['suministroelectricidad']);
        } else {
            $inmueble->setSuministroelectricidad(null);
        }
        if (isset($datos['pozo'])) {
            $inmueble->setPozo($datos['pozo']);
        } else {
            $inmueble->setPozo(null);
        }
        if (isset($datos['aperos'])) {
            $inmueble->setAperos($datos['aperos']);
        } else {
            $inmueble->setAperos(null);
        }
        if (isset($datos['salas'])) {
            $inmueble->setSalas($datos['salas']);
        } else {
            $inmueble->setSalas(null);
        }
        if (isset($datos['porcentajeconstruido'])) {
            $inmueble->setPorcentajeconstruido($datos['porcentajeconstruido']);
        } else {
            $inmueble->setPorcentajeconstruido(null);
        }
        if (isset($datos['descripcion'])) {
            $inmueble->setDescripcion($datos['descripcion']);
        }else{
            $inmueble->setDescripcion(null);
        }
        if (isset($datos['terrazas'])) {
            $inmueble->setTerrazas($datos['terrazas']);
        }else{
            $inmueble->setTerrazas(null);
        }


        //persistir y flushear
        $this->em->persist($inmueble);
        $this->em->flush();
    
        return $inmueble;
    }

   public function borrarInmueble(Inmueble $in){
        
        $this->em->remove($in);
        $this->em->flush();

    }
}
