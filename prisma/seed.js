const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function seed() {
  const createdCustomer = await prisma.customer.create({
    data: {
      name: "Alice",
    },
  });

  console.log("Customer created", createdCustomer);

  // Add your code here
  const createdContact = await prisma.contact.create({
    data: {
      customerId: 1,
      phone: "7462401023",
      email: "something@checkout.co",
    },
  });

  const createdMovie = await prisma.movie.create({
    data: {
      title: "Dragon Rturns",
      runtimeMins: 160,
    },
  });

  const createdScreen = await prisma.screen.create({
    data: {
      number: 1, 
    },
  });
  const createdScreening = await prisma.screening.create({
    data: {
      movieId: createdMovie.id,
      screenId: createdScreen.id,
      startsAt: new Date('2024-09-13T20:00:00Z')
    },
  });

  const createdTicket = await prisma.ticket.create({
    data: {
        customerId: 1,
        screeningId: 1
    },
  });

  // Don't edit any of the code below this line
  process.exit(0);
}

seed().catch(async (error) => {
  console.error(error);
  await prisma.$disconnect();
  process.exit(1);
});
