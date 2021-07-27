<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210727114019 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE venta (id INT AUTO_INCREMENT NOT NULL, usuario_id INT DEFAULT NULL, inmueble_id INT DEFAULT NULL, fechaventa DATETIME NOT NULL, iva INT NOT NULL, total NUMERIC(10, 2) NOT NULL, reserva NUMERIC(10, 2) NOT NULL, INDEX IDX_8FE7EE55DB38439E (usuario_id), INDEX IDX_8FE7EE55932498D9 (inmueble_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE venta ADD CONSTRAINT FK_8FE7EE55DB38439E FOREIGN KEY (usuario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE venta ADD CONSTRAINT FK_8FE7EE55932498D9 FOREIGN KEY (inmueble_id) REFERENCES inmueble (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE venta');
    }
}
