<?php

namespace App\Entity;

use App\Repository\VentaRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=VentaRepository::class)
 */
class Venta
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Usuario::class)
     */
    private $usuario;

    /**
     * @ORM\ManyToOne(targetEntity=Inmueble::class)
     */
    private $inmueble;

    /**
     * @ORM\Column(type="datetime")
     */
    private $fechaventa;

    /**
     * @ORM\Column(type="integer")
     */
    private $iva;

    /**
     * @ORM\Column(type="decimal", precision=10, scale=2)
     */
    private $total;

    /**
     * @ORM\Column(type="decimal", precision=10, scale=2)
     */
    private $reserva;

    /**
     * @ORM\ManyToOne(targetEntity=Usuario::class)
     */
    private $Propietario;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUsuario(): ?Usuario
    {
        return $this->usuario;
    }

    public function setUsuario(?Usuario $usuario): self
    {
        $this->usuario = $usuario;

        return $this;
    }

    public function getInmueble(): ?Inmueble
    {
        return $this->inmueble;
    }

    public function setInmueble(?Inmueble $inmueble): self
    {
        $this->inmueble = $inmueble;

        return $this;
    }

    public function getFechaventa(): ?\DateTimeInterface
    {
        return $this->fechaventa;
    }

    public function setFechaventa(\DateTimeInterface $fechaventa): self
    {
        $this->fechaventa = $fechaventa;

        return $this;
    }

    public function getIva(): ?int
    {
        return $this->iva;
    }

    public function setIva(int $iva): self
    {
        $this->iva = $iva;

        return $this;
    }

    public function getTotal(): ?string
    {
        return $this->total;
    }

    public function setTotal(string $total): self
    {
        $this->total = $total;

        return $this;
    }

    public function getReserva(): ?string
    {
        return $this->reserva;
    }

    public function setReserva(string $reserva): self
    {
        $this->reserva = $reserva;

        return $this;
    }

    public function getPropietario(): ?Usuario
    {
        return $this->Propietario;
    }

    public function setPropietario(?Usuario $Propietario): self
    {
        $this->Propietario = $Propietario;

        return $this;
    }
}
