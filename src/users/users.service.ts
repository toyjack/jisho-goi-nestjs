import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { Prisma, User } from '@prisma/client';

@Injectable()
export class UsersService {
  constructor(private prismaService: PrismaService) {}

  async findOne(username: string): Promise<User | undefined> {
    return this.prismaService.user.findUnique({
      where: {
        username,
      },
    });
  }

  async createUser(input: Prisma.UserCreateInput): Promise<User> {
    return this.prismaService.user.create({
      data: input,
    });
  }
}
