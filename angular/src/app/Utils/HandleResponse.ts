import { Observable } from "rxjs";
import { map } from "rxjs/operators";
import { GeneralResponse } from "./GeneralResponse";

export function handleResponse<T>() {
  return (source: Observable<GeneralResponse<T>>) => {
    return new Observable<T>(subscriber => {
      source.subscribe({
        next: (response: GeneralResponse<T>) => {
          if (response.flag) {
            subscriber.next(response.payload as T);
          } else {
            subscriber.error(new Error(response.message));
          }
        },
        error: (err: any) => {
          subscriber.error(err);
        },
        complete: () => {
          subscriber.complete();
        }
      });
    });
  };
}
