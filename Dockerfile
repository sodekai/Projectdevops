FROM golang:1.21.5
WORKDIR /app

COPY webapi/ .

RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping

# Add environment variable for team name
ENV TEAM_NAME="YourTeamName"

EXPOSE 8081

CMD ["/docker-gs-ping"]