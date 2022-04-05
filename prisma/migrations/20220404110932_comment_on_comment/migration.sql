-- CreateTable
CREATE TABLE "commentOnComment" (
    "id" SERIAL NOT NULL,
    "content" VARCHAR(250) NOT NULL,
    "commentId" INTEGER NOT NULL,
    "postId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "commentOnComment_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "commentOnComment" ADD CONSTRAINT "commentOnComment_commentId_fkey" FOREIGN KEY ("commentId") REFERENCES "Comment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
