FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

WORKDIR /app

COPY . ./

RUN dotnet publish --configuration Release --output out

FROM mcr.microsoft.com/dotnet/aspnet:5.0

COPY --from=build /app/out .

CMD dotnet app.dll