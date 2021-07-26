<?php

namespace App\Entity;

use App\Repository\InmuebleRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=InmuebleRepository::class)
 */
class Inmueble
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Tipologia::class)
     */
    private $tipologia;

    /**
     * @ORM\ManyToOne(targetEntity=Cartera::class)
     */
    private $cartera;

    /**
     * @ORM\ManyToOne(targetEntity=Propietario::class)
     */
    private $propietario;

    /**
     * @ORM\ManyToOne(targetEntity=Status1::class)
     */
    private $status1;

    /**
     * @ORM\ManyToOne(targetEntity=Status2::class)
     */
    private $status2;

    /**
     * @ORM\ManyToOne(targetEntity=Uso::class)
     */
    private $uso;

    /**
     * @ORM\ManyToOne(targetEntity=Comercializacion::class)
     */
    private $comercializacion;

    /**
     * @ORM\Column(type="decimal", precision=10, scale=2)
     */
    private $precio;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $direccion;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $localidad;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $provincia;

    /**
     * @ORM\Column(type="integer")
     */
    private $anoconstruccion;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $calefaccion;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $aireacondicionado;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $piscina;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $garaje;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $banos;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $cocina;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $dormitorios;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $ascensor;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $trastero;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $buhardilla;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $plantas;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $salas;

    /**
     * @ORM\Column(type="decimal", precision=5, scale=2, nullable=true)
     */
    private $porcentajeconstruido;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $m2construido;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $m2parcela;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $licactividad;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $suminostroagua;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $suministroelectricidad;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $pozo;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $aperos;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $m2superficie;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $rutaimagen;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTipologia(): ?Tipologia
    {
        return $this->tipologia;
    }

    public function setTipologia(?Tipologia $tipologia): self
    {
        $this->tipologia = $tipologia;

        return $this;
    }

    public function getCartera(): ?Cartera
    {
        return $this->cartera;
    }

    public function setCartera(?Cartera $cartera): self
    {
        $this->cartera = $cartera;

        return $this;
    }

    public function getPropietario(): ?Propietario
    {
        return $this->propietario;
    }

    public function setPropietario(?Propietario $propietario): self
    {
        $this->propietario = $propietario;

        return $this;
    }

    public function getStatus1(): ?Status1
    {
        return $this->status1;
    }

    public function setStatus1(?Status1 $status1): self
    {
        $this->status1 = $status1;

        return $this;
    }

    public function getStatus2(): ?Status2
    {
        return $this->status2;
    }

    public function setStatus2(?Status2 $status2): self
    {
        $this->status2 = $status2;

        return $this;
    }

    public function getUso(): ?Uso
    {
        return $this->uso;
    }

    public function setUso(?Uso $uso): self
    {
        $this->uso = $uso;

        return $this;
    }

    public function getComercializacion(): ?Comercializacion
    {
        return $this->comercializacion;
    }

    public function setComercializacion(?Comercializacion $comercializacion): self
    {
        $this->comercializacion = $comercializacion;

        return $this;
    }

    public function getPrecio(): ?string
    {
        return $this->precio;
    }

    public function setPrecio(string $precio): self
    {
        $this->precio = $precio;

        return $this;
    }

    public function getDireccion(): ?string
    {
        return $this->direccion;
    }

    public function setDireccion(string $direccion): self
    {
        $this->direccion = $direccion;

        return $this;
    }

    public function getLocalidad(): ?string
    {
        return $this->localidad;
    }

    public function setLocalidad(string $localidad): self
    {
        $this->localidad = $localidad;

        return $this;
    }

    public function getProvincia(): ?string
    {
        return $this->provincia;
    }

    public function setProvincia(string $provincia): self
    {
        $this->provincia = $provincia;

        return $this;
    }

    public function getAnoconstruccion(): ?int
    {
        return $this->anoconstruccion;
    }

    public function setAnoconstruccion(int $anoconstruccion): self
    {
        $this->anoconstruccion = $anoconstruccion;

        return $this;
    }

    public function getCalefaccion(): ?bool
    {
        return $this->calefaccion;
    }

    public function setCalefaccion(?bool $calefaccion): self
    {
        $this->calefaccion = $calefaccion;

        return $this;
    }

    public function getAireacondicionado(): ?bool
    {
        return $this->aireacondicionado;
    }

    public function setAireacondicionado(?bool $aireacondicionado): self
    {
        $this->aireacondicionado = $aireacondicionado;

        return $this;
    }

    public function getPiscina(): ?bool
    {
        return $this->piscina;
    }

    public function setPiscina(?bool $piscina): self
    {
        $this->piscina = $piscina;

        return $this;
    }

    public function getGaraje(): ?bool
    {
        return $this->garaje;
    }

    public function setGaraje(?bool $garaje): self
    {
        $this->garaje = $garaje;

        return $this;
    }

    public function getBanos(): ?int
    {
        return $this->banos;
    }

    public function setBanos(?int $banos): self
    {
        $this->banos = $banos;

        return $this;
    }

    public function getCocina(): ?bool
    {
        return $this->cocina;
    }

    public function setCocina(?bool $cocina): self
    {
        $this->cocina = $cocina;

        return $this;
    }

    public function getDormitorios(): ?int
    {
        return $this->dormitorios;
    }

    public function setDormitorios(?int $dormitorios): self
    {
        $this->dormitorios = $dormitorios;

        return $this;
    }

    public function getAscensor(): ?bool
    {
        return $this->ascensor;
    }

    public function setAscensor(?bool $ascensor): self
    {
        $this->ascensor = $ascensor;

        return $this;
    }

    public function getTrastero(): ?bool
    {
        return $this->trastero;
    }

    public function setTrastero(?bool $trastero): self
    {
        $this->trastero = $trastero;

        return $this;
    }

    public function getBuhardilla(): ?bool
    {
        return $this->buhardilla;
    }

    public function setBuhardilla(?bool $buhardilla): self
    {
        $this->buhardilla = $buhardilla;

        return $this;
    }

    public function getPlantas(): ?int
    {
        return $this->plantas;
    }

    public function setPlantas(?int $plantas): self
    {
        $this->plantas = $plantas;

        return $this;
    }

    public function getSalas(): ?int
    {
        return $this->salas;
    }

    public function setSalas(?int $salas): self
    {
        $this->salas = $salas;

        return $this;
    }

    public function getPorcentajeconstruido(): ?string
    {
        return $this->porcentajeconstruido;
    }

    public function setPorcentajeconstruido(?string $porcentajeconstruido): self
    {
        $this->porcentajeconstruido = $porcentajeconstruido;

        return $this;
    }

    public function getM2construido(): ?int
    {
        return $this->m2construido;
    }

    public function setM2construido(?int $m2construido): self
    {
        $this->m2construido = $m2construido;

        return $this;
    }

    public function getM2parcela(): ?int
    {
        return $this->m2parcela;
    }

    public function setM2parcela(?int $m2parcela): self
    {
        $this->m2parcela = $m2parcela;

        return $this;
    }

    public function getLicactividad(): ?bool
    {
        return $this->licactividad;
    }

    public function setLicactividad(?bool $licactividad): self
    {
        $this->licactividad = $licactividad;

        return $this;
    }

    public function getSuminostroagua(): ?bool
    {
        return $this->suminostroagua;
    }

    public function setSuminostroagua(?bool $suminostroagua): self
    {
        $this->suminostroagua = $suminostroagua;

        return $this;
    }

    public function getSuministroelectricidad(): ?bool
    {
        return $this->suministroelectricidad;
    }

    public function setSuministroelectricidad(?bool $suministroelectricidad): self
    {
        $this->suministroelectricidad = $suministroelectricidad;

        return $this;
    }

    public function getPozo(): ?bool
    {
        return $this->pozo;
    }

    public function setPozo(?bool $pozo): self
    {
        $this->pozo = $pozo;

        return $this;
    }

    public function getAperos(): ?bool
    {
        return $this->aperos;
    }

    public function setAperos(?bool $aperos): self
    {
        $this->aperos = $aperos;

        return $this;
    }

    public function getM2superficie(): ?int
    {
        return $this->m2superficie;
    }

    public function setM2superficie(?int $m2superficie): self
    {
        $this->m2superficie = $m2superficie;

        return $this;
    }

    public function getRutaimagen(): ?string
    {
        return $this->rutaimagen;
    }

    public function setRutaimagen(?string $rutaimagen): self
    {
        $this->rutaimagen = $rutaimagen;

        return $this;
    }
}
