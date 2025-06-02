import { Observable, throwError } from "rxjs";
import { map, catchError } from "rxjs/operators";
import { GeneralResponse } from "./GeneralResponse";

export function handleResponse<T>() {
  return (source: Observable<GeneralResponse<T>>): Observable<T> => {
    return source.pipe(
      map((response: GeneralResponse<T>) => {
        if (response.flag) {
          return response.payload as T;
        } else {
          throw new Error(response.message || 'Unknown server error');
        }
      }),
      catchError((error) => {
        // Optional: Customize or wrap the error here
        return throwError(() => new Error(error.message || 'Unhandled error occurred'));
      })
    );
  };
}
