import { Router } from 'express';
import TestRouter from './TestRouter';

type RouterConfig = {
  path: string;
  router: Router;
};

const routesConfig: RouterConfig[] = [
  {
    path: '/test',
    router: TestRouter,
  },
];
function routes(app) {
  routesConfig.forEach((route) => {
    app.use(`/api${route.path}`, route.router);
  });
}
export default routes;
