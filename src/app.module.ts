import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { AppController } from './app.controller';
import { AuthController } from './auth/auth.controller';
import { PrismaModule } from './prisma/prisma.module';
import { ApiModule } from './api/api.module';

@Module({
  imports: [AuthModule, UsersModule, PrismaModule, ApiModule],
  controllers: [AppController, AuthController],
  providers: [],
})
export class AppModule {}
