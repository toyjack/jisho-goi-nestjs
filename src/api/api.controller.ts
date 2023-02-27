import { Controller, Get, Param, Query } from '@nestjs/common';
import { ApiService } from './api.service';
import {
  SearchBunmeiDto,
  SearchGyokuhenDto,
  SearchJiruishoDto,
  SearchRacvyoxvDto,
} from './dto';

@Controller('api')
export class ApiController {
  constructor(private readonly apiService: ApiService) {}

  @Get('/jiruisho/search')
  searchJiruisho(@Query() query: SearchJiruishoDto) {
    return this.apiService.searchJiruisho(query);
  }

  @Get('/racvyoxv/search')
  searchRacvyoxv(@Query() query: SearchRacvyoxvDto) {
    return this.apiService.searchRacvyoxv(query);
  }

  @Get('/bunmei/search')
  searchBunmei(@Query() query: SearchBunmeiDto) {
    return this.apiService.searchBunmei(query);
  }

  @Get('/gyokuhentaizen/search')
  search(@Query() query: SearchGyokuhenDto) {
    return this.apiService.searchGyokuhen(query);
  }

  @Get('/jiruisho/:id')
  findOneJiruisho(@Param('id') id: string) {
    return this.apiService.jiruishoFindOne(Number(id));
  }

  @Get('/racvyoxv/:id')
  findOneRacvyoxv(@Param('id') id: string) {
    return this.apiService.racvyoxvFindOne(Number(id));
  }

  @Get('/bunmei/:id')
  findOneBunmei(@Param('id') id: string) {
    return this.apiService.bunmeiFindOne(id);
  }
  @Get('/gyokuhentaizen/:id')
  findOne(@Param('id') id: string) {
    return this.apiService.gyokuhenFindOne(id);
  }
}
