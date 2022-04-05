const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function seed() {
  const createdUsers = await prisma.user.create({
    data: { username: "alicey", email: "sib@fhghj.com" },
  });
  console.log("createduser", createdUsers);
  // Add your code here
  const profile = await prisma.profile.create({
    data: {
      forename: "Appla",
      surename: "Orange",
      age: 87,
      profilePicture: "URL",
      biography: "dfdfsfsfdsdfasdasdsdsdsdsadsdasdsdasdasdsdsdsasdasd",
      userId: createdUsers.id,
    },
  });
  console.log("profile", profile);
  const post = await prisma.post.create({
    data: {
      title: "Prisma",
      content: "vnkfnvkdfl",
      picture: "url",
      published: true,
      userId: createdUsers.id,
    },
  });
  console.log("post", post);
  const comment = await prisma.comment.create({
    data: {
      content: "I'm commenting on the prisma post by the user Alice",
      postId: post.id,
    },
  });
  console.log("comment", comment);
  const commentOnComment = await prisma.commentOnComment.create({
    data: {
      content: "I'll have to disagree with Alice's point on ...",
      commentId: comment.id,
    },
  });
  console.log(" commentOnComment ", commentOnComment);
  // Don't edit any of the code below this line
  process.exit(0);
}

seed().catch(async (error) => {
  console.error(error);
  await prisma.$disconnect();
  process.exit(1);
});
