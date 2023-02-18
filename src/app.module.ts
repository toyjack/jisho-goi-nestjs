import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { AppController } from './app.controller';
import { AuthController } from './auth/auth.controller';

@Module({
  imports: [AuthModule, UsersModule],
  controllers: [AppController, AuthController],
  providers: [],
})
export class AppModule {}
