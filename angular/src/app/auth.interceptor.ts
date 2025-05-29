import { HttpEvent, HttpHandler, HttpInterceptor, HttpInterceptorFn, HttpRequest } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

export const authInterceptor : HttpInterceptorFn = (req, next) => {
   const token = localStorage.getItem('accessToken');

   console.log('AuthInterceptor: Intercepting request', req.url);
   console.log('AuthInterceptor: Access Token:', token);

    if (token) {
      const authReq = req.clone({
        // headers: req.headers.set('Authorization', 'Bearer ' + token)
        setHeaders: {
          Authorization: `Bearer ${token}`
        }
      });
      return next(authReq);
    }
  return next(req).pipe(
    // If you want to handle errors globally, you can add catchError here
    // catchError(error => {
    //   if (error.status === 401 && !req.url.includes('/auth/refresh')) {
    //     return authService.refreshToken().pipe(
    //       switchMap(() => {
    //         const newToken = authService.getAccessToken();
    //         const newReq = req.clone({
    //           setHeaders: {
    //             Authorization: `Bearer ${newToken}`
    //           }
    //         });
    //         return next(newReq);
    //       }),
    //       catchError(refreshError => {
    //         authService.logout();
    //         return throwError(refreshError);
    //       })
    //     );
    //   }
    //   return throwError(error);
    // })
  );
};
