export interface UserData {
    userType: string;
    userName: string;
    userId: string;
    email: string;
}

export interface LoginResponse {
    flag: boolean;
    userData: UserData;
    accessToken: string;
    refreshToken: string;
    message: string;
}
