import { Injectable } from '@nestjs/common';

export type User = any;

@Injectable()
export class UsersService {
  private readonly user = [
    {
      userId: 1,
      username: 'toyjack',
      password: '123456',
    },
  ];

  async findOne(username: string): Promise<User | undefined> {
    return this.user.find((user) => user.username == username);
  }
}
