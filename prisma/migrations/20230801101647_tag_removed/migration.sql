/*
  Warnings:

  - You are about to drop the `tag` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tagsontools` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `tags` to the `Tool` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `tagsontools` DROP FOREIGN KEY `TagsOnTools_tagId_fkey`;

-- DropForeignKey
ALTER TABLE `tagsontools` DROP FOREIGN KEY `TagsOnTools_toolId_fkey`;

-- AlterTable
ALTER TABLE `tool` ADD COLUMN `tags` VARCHAR(191) NOT NULL;

-- DropTable
DROP TABLE `tag`;

-- DropTable
DROP TABLE `tagsontools`;
