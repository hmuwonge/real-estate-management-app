interface UserData {
    userType: string;
    userName: string;
    email: string;
}

export interface LoginResponse {
    flag: boolean;
    userData: UserData;
    accessToken: string;
    refreshToken: string;
    message: string;
}
