-- CreateTable
CREATE TABLE "Profile" (
    "id" SERIAL NOT NULL,
    "biography" VARCHAR(120) NOT NULL,
    "profilePicture" TEXT NOT NULL,
    "forename" TEXT NOT NULL,
    "surename" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Profile_biography_key" ON "Profile"("biography");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_userId_key" ON "Profile"("userId");

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
