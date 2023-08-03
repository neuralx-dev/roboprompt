-- CreateTable
CREATE TABLE `auth_user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `role` ENUM('USER', 'PREMIUM', 'ADMIN') NOT NULL DEFAULT 'USER',
    `verified` BOOLEAN NOT NULL DEFAULT false,
    `receiveEmail` BOOLEAN NOT NULL DEFAULT true,
    `token` VARCHAR(191) NULL,
    `createdAt` TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updatedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `auth_user_id_key`(`id`),
    UNIQUE INDEX `auth_user_email_key`(`email`),
    UNIQUE INDEX `auth_user_token_key`(`token`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `auth_session` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `active_expires` BIGINT NOT NULL,
    `idle_expires` BIGINT NOT NULL,

    UNIQUE INDEX `auth_session_id_key`(`id`),
    INDEX `auth_session_user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `auth_key` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `hashed_password` VARCHAR(191) NULL,
    `user_id` INTEGER NOT NULL,
    `primary_key` BOOLEAN NOT NULL,
    `expires` BIGINT NULL,

    UNIQUE INDEX `auth_key_id_key`(`id`),
    INDEX `auth_key_user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tool` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL DEFAULT '',
    `logo` VARCHAR(191) NOT NULL,
    `banner` VARCHAR(191) NOT NULL,
    `short_desc` VARCHAR(191) NOT NULL,
    `description` LONGTEXT NOT NULL,

    UNIQUE INDEX `Tool_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tag` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Tag_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TagsOnTools` (
    `toolId` INTEGER NOT NULL,
    `tagId` INTEGER NOT NULL,
    `assignedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `assignedBy` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`toolId`, `tagId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `auth_session` ADD CONSTRAINT `auth_session_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `auth_user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `auth_key` ADD CONSTRAINT `auth_key_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `auth_user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TagsOnTools` ADD CONSTRAINT `TagsOnTools_toolId_fkey` FOREIGN KEY (`toolId`) REFERENCES `Tool`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TagsOnTools` ADD CONSTRAINT `TagsOnTools_tagId_fkey` FOREIGN KEY (`tagId`) REFERENCES `Tag`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
