import { Controller, Get, Param, Query } from '@nestjs/common';
import { ApiService } from './api.service';
import { SearchBunmeiDto, SearchGyokuhenDto } from './dto';

@Controller('api')
export class ApiController {
  constructor(private readonly apiService: ApiService) {}

  @Get('/gyokuhentaizen/search')
  search(@Query() query: SearchGyokuhenDto) {
    return this.apiService.searchGyokuhen(query);
  }
  @Get('/gyokuhentaizen/:id')
  findOne(@Param('id') id: string) {
    return this.apiService.gyokuhenFindOne(id);
  }

  @Get('/bunmei/search')
  searchBunmei(@Query() query: SearchBunmeiDto) {
    return this.apiService.searchBunmei(query);
  }

  @Get('/bunmei/:id')
  findOneBunmei(@Param('id') id: string) {
    return this.apiService.bunmeiFindOne(id);
  }
}
