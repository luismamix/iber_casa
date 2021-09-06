<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210906174538 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE inmueble DROP FOREIGN KEY FK_476C897953C8D32C');
        $this->addSql('DROP TABLE propietario');
        $this->addSql('DROP INDEX IDX_476C897953C8D32C ON inmueble');
        $this->addSql('ALTER TABLE inmueble DROP propietario_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE propietario (id INT AUTO_INCREMENT NOT NULL, nombre VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE inmueble ADD propietario_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE inmueble ADD CONSTRAINT FK_476C897953C8D32C FOREIGN KEY (propietario_id) REFERENCES propietario (id)');
        $this->addSql('CREATE INDEX IDX_476C897953C8D32C ON inmueble (propietario_id)');
    }
}
