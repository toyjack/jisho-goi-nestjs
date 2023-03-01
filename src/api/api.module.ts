import { Module } from '@nestjs/common';
import {
  BunmeibonService,
  GyokuhentaizenService,
  JiruishoService,
  RacyvoxvService,
  WakunnoshioriService,
} from './services';
import {
  BunmeibonController,
  GyokuhentaizenController,
  JiruishoController,
  RacvyoxvController,
  WakunnoshioriController,
} from './controllers';

@Module({
  providers: [
    JiruishoService,
    RacyvoxvService,
    WakunnoshioriService,
    BunmeibonService,
    GyokuhentaizenService,
  ],
  controllers: [
    RacvyoxvController,
    BunmeibonController,
    JiruishoController,
    WakunnoshioriController,
    GyokuhentaizenController,
  ],
})
export class ApiModule {}
