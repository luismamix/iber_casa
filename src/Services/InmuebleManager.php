<?php

namespace App\Services;

use App\Entity\Inmueble;
use App\Repository\CarteraRepository;
use App\Repository\ComercializacionRepository;
use App\Repository\PropietarioRepository;
use App\Repository\Status1Repository;
use App\Repository\Status2Repository;
use App\Repository\TipologiaRepository;
use App\Repository\UsoRepository;
use Doctrine\ORM\EntityManagerInterface;

class InmuebleManager{
    private $em;

  public function __construct(EntityManagerInterface $em)
  {
    $this->em = $em;
  }

  public function crearInmueble(array $datos,
                                TipologiaRepository $tr, 
                                CarteraRepository $ca, 
                                PropietarioRepository $pro,
                                Status1Repository $st1,
                                Status2Repository $st2,
                                UsoRepository $uso,
                                ComercializacionRepository $com,
                                string $rutaProyecto){
    $inmueble = new Inmueble();
    
    //setear los datos recibidos
    if(isset($datos['tipologia'])){
      $tipologia = $tr->find($datos['tipologia']);
      $inmueble->setTipologia($tipologia);
    }
    if(isset($datos['cartera'])){
      $cartera = $ca->find($datos['cartera']);
      $inmueble->setCartera($cartera);
    }
    if(isset($datos['propietario'])){
      $propietario = $pro->find($datos['propietario']);
      $inmueble->setPropietario($propietario);
    }
    if(isset($datos['status1'])){
      $status1 = $st1->find($datos['status1']);
      $inmueble->setStatus1($status1);
    }
    if(isset($datos['status2'])){
      $status2 = $st2->find($datos['status2']);
      $inmueble->setStatus2($status2);
    }
    if(isset($datos['comercializacion'])){
      $comercializacion = $com->find($datos['comercializacion']);
      $inmueble->setComercializacion($comercializacion);
    }
    if(isset($datos['uso'])){
      $uso = $uso->find($datos['uso']);
      $inmueble->setUso($uso);
    }
    if(isset($datos['rutaimagen'])){

      //obtener el fichero
      $file=$datos['rutaimagen'];
      
      //construir nombre fichero
      $filename =  'img_'.uniqid().'.JPG';
     
      //moverlo a la ruta public/images
      $file->move( $rutaProyecto.'/public/images/', $filename);
      
      //setear la ruta de la imagen + filename
      $inmueble->setRutaimagen("images/". $filename);
      
    }
    if(isset($datos['precio'])){
      $inmueble->setPrecio($datos['precio']);
    }
    if(isset($datos['direccion'])){
      $inmueble->setDireccion($datos['direccion']);
    }
    if(isset($datos['localidad'])){
      $inmueble->setLocalidad($datos['localidad']);
    }
    if(isset($datos['provincia'])){
      $inmueble->setProvincia($datos['provincia']);
    }
    if(isset($datos['m2construido'])){
      $inmueble->setM2construido($datos['m2construido']);
    }
    if(isset($datos['anoconstruccion'])){
      $inmueble->setAnoconstruccion($datos['anoconstruccion']);
    }
    if(isset($datos['plantas'])){
      $inmueble->setPlantas($datos['plantas']);
    }
    if(isset($datos['banos'])){
      $inmueble->setBanos($datos['banos']);
    }
    if(isset($datos['licactividad'])){
      $inmueble->setLicactividad($datos['licactividad']);
    }
    if(isset($datos['certenergetico'])){
      $inmueble->setCertenergetico($datos['certenergetico']);
    }
    if(isset($datos['m2parcela'])){
      $inmueble->setM2parcela($datos['m2parcela']);
    }
    if(isset($datos['cocina'])){
      $inmueble->setCocina($datos['cocina']);
    }
    if(isset($datos['aireacondicionado'])){
      $inmueble->setAireacondicionado($datos['aireacondicionado']);
    }
    if(isset($datos['calefaccion'])){
      $inmueble->setCalefaccion($datos['calefaccion']);
    }
    if(isset($datos['garaje'])){
      $inmueble->setGaraje($datos['garaje']);
    }
    if(isset($datos['dormitorios'])){
      $inmueble->setDormitorios($datos['dormitorios']);
    }
    if(isset($datos['piscina'])){
      $inmueble->setPiscina($datos['piscina']);
    }
    if(isset($datos['ascensor'])){
      $inmueble->setAscensor($datos['ascensor']);
    }
    if(isset($datos['trastero'])){
      $inmueble->setTrastero($datos['trastero']);
    }
    if(isset($datos['buhardilla'])){
      $inmueble->setBuhardilla($datos['buhardilla']);
    }
    if(isset($datos['m2superficie'])){
      $inmueble->setM2superficie($datos['m2superficie']);
    }
    if(isset($datos['suministroagua'])){
      $inmueble->setSuminostroagua($datos['suministroagua']);
    }
    if(isset($datos['suministroelectricidad'])){
      $inmueble->setSuministroelectricidad($datos['suministroelectricidad']);
    }
    if(isset($datos['pozo'])){
      $inmueble->setPozo($datos['pozo']);
    }
    if(isset($datos['aperos'])){
      $inmueble->setAperos($datos['aperos']);
    }
    if(isset($datos['salas'])){
      $inmueble->setSalas($datos['salas']);
    }
    if(isset($datos['porcentajeconstruido'])){
      $inmueble->setPorcentajeconstruido($datos['porcentajeconstruido']);
    }
    
    //persistir y flushear
    $this->em->persist($inmueble);
    $this->em->flush();
    
    return $inmueble;
  }
}