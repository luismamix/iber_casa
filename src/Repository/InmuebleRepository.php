<?php

namespace App\Repository;

use App\Entity\Inmueble;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Inmueble|null find($id, $lockMode = null, $lockVersion = null)
 * @method Inmueble|null findOneBy(array $criteria, array $orderBy = null)
 * @method Inmueble[]    findAll()
 * @method Inmueble[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class InmuebleRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Inmueble::class);
    }

    // /**
    //  * @return Inmueble[] Returns an array of Inmueble objects
    //  */
    
    public function findBy_CUSTOM_Paginado($page, $uso, $tipologia, $status1)
    {
        $em = $this->getEntityManager();
        $where="";
        $fields = array();

        if ($uso != null) {
            echo "uso : $uso ,";
            $fields[] = " inm.uso = $uso ";
        }
        if ($tipologia != null) {
            echo "tipologia : $tipologia, ";
            $fields[] = " inm.tipologia = $tipologia ";
        }
        if ($status1 != null) {
            echo "status1 : $status1";
            $fields[] = " inm.status1 = $status1 ";
        }

        switch (count($fields)) {
            case 0:
                $where="";
                break;
            case 1:
                $where=" WHERE $fields[0] ";
                break;
            case 2:
                $where=" WHERE $fields[0] AND $fields[1] ";
                break;
            case 3:
                $where=" WHERE $fields[0] AND $fields[1] AND $fields[2] ";
                break;
            default:
                # code... ACK ACK
                break;
        }
       
        $q = $em->createQuery(
            "SELECT inm, ca, com, pro, st1, st2, tpl, u 
            FROM App\Entity\Inmueble inm
            JOIN inm.cartera ca
            JOIN inm.comercializacion com
            JOIN inm.propietario pro
            JOIN inm.status1 st1
            JOIN inm.status2 st2
            JOIN inm.tipologia tpl
            JOIN inm.uso u
            $where
            ORDER BY inm.tipologia, inm.id"
        );
        $q->setMaxResults(10);
        $q->setFirstResult(($page -1)*10);
        // returns an array of Product objects
        return $q->getResult();
    }
  
    public function findBy_CUSTOM($uso, $tipologia, $status1)
    {
        $em = $this->getEntityManager();
        $where="";
        $fields = array();

        if ($uso != null) {
            $fields[] = " inm.uso = $uso ";
        }
        if ($tipologia != null) {
            $fields[] = " inm.tipologia = $tipologia ";
        }
        if ($status1 != null) {
            $fields[] = " inm.status1 = $status1 ";
        }

        switch (count($fields)) {
            case 0:
                $where="";
                break;
            case 1:
                $where=" WHERE $fields[0] ";
                break;
            case 2:
                $where=" WHERE $fields[0] AND $fields[1] ";
                break;
            case 3:
                $where=" WHERE $fields[0] AND $fields[1] AND $fields[2] ";
                break;
            default:
                # code... ACK ACK
                break;
        }
       
        $q = $em->createQuery(
            "SELECT COUNT(inm.id)
            FROM App\Entity\Inmueble inm
            JOIN inm.cartera ca
            JOIN inm.comercializacion com
            JOIN inm.propietario pro
            JOIN inm.status1 st1
            JOIN inm.status2 st2
            JOIN inm.tipologia tpl
            JOIN inm.uso u
            $where
            ORDER BY inm.tipologia, inm.id"
        );
        
        // devuelve el nº d inmuebles 
        return $q->getSingleScalarResult();
        //return $q->getResult();
    }

    // /**
    //  * @return Inmueble[] Returns an array of Inmueble objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('i')
            ->andWhere('i.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('i.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Inmueble
    {
        return $this->createQueryBuilder('i')
            ->andWhere('i.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
