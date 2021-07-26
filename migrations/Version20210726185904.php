<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210726185904 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE inmueble (id INT AUTO_INCREMENT NOT NULL, tipologia_id INT DEFAULT NULL, cartera_id INT DEFAULT NULL, propietario_id INT DEFAULT NULL, status1_id INT DEFAULT NULL, status2_id INT DEFAULT NULL, uso_id INT DEFAULT NULL, comercializacion_id INT DEFAULT NULL, precio NUMERIC(10, 2) NOT NULL, direccion VARCHAR(255) NOT NULL, localidad VARCHAR(255) NOT NULL, provincia VARCHAR(255) NOT NULL, anoconstruccion INT NOT NULL, calefaccion TINYINT(1) DEFAULT NULL, aireacondicionado TINYINT(1) DEFAULT NULL, piscina TINYINT(1) DEFAULT NULL, garaje TINYINT(1) DEFAULT NULL, banos INT DEFAULT NULL, cocina TINYINT(1) DEFAULT NULL, dormitorios INT DEFAULT NULL, ascensor TINYINT(1) DEFAULT NULL, trastero TINYINT(1) DEFAULT NULL, buhardilla TINYINT(1) DEFAULT NULL, plantas INT DEFAULT NULL, salas INT DEFAULT NULL, porcentajeconstruido NUMERIC(5, 2) DEFAULT NULL, m2construido INT DEFAULT NULL, m2parcela INT DEFAULT NULL, licactividad TINYINT(1) DEFAULT NULL, suminostroagua TINYINT(1) DEFAULT NULL, suministroelectricidad TINYINT(1) DEFAULT NULL, pozo TINYINT(1) DEFAULT NULL, aperos TINYINT(1) DEFAULT NULL, m2superficie INT DEFAULT NULL, rutaimagen VARCHAR(255) DEFAULT NULL, INDEX IDX_476C8979636030D6 (tipologia_id), INDEX IDX_476C8979A5A18135 (cartera_id), INDEX IDX_476C897953C8D32C (propietario_id), INDEX IDX_476C897963D715A2 (status1_id), INDEX IDX_476C89797162BA4C (status2_id), INDEX IDX_476C8979AE1A5CB9 (uso_id), INDEX IDX_476C8979871C9A1E (comercializacion_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE inmueble ADD CONSTRAINT FK_476C8979636030D6 FOREIGN KEY (tipologia_id) REFERENCES tipologia (id)');
        $this->addSql('ALTER TABLE inmueble ADD CONSTRAINT FK_476C8979A5A18135 FOREIGN KEY (cartera_id) REFERENCES cartera (id)');
        $this->addSql('ALTER TABLE inmueble ADD CONSTRAINT FK_476C897953C8D32C FOREIGN KEY (propietario_id) REFERENCES propietario (id)');
        $this->addSql('ALTER TABLE inmueble ADD CONSTRAINT FK_476C897963D715A2 FOREIGN KEY (status1_id) REFERENCES status1 (id)');
        $this->addSql('ALTER TABLE inmueble ADD CONSTRAINT FK_476C89797162BA4C FOREIGN KEY (status2_id) REFERENCES status2 (id)');
        $this->addSql('ALTER TABLE inmueble ADD CONSTRAINT FK_476C8979AE1A5CB9 FOREIGN KEY (uso_id) REFERENCES uso (id)');
        $this->addSql('ALTER TABLE inmueble ADD CONSTRAINT FK_476C8979871C9A1E FOREIGN KEY (comercializacion_id) REFERENCES comercializacion (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE inmueble');
    }
}
