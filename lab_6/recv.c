#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <netdb.h>
#include <unistd.h>

#define MAX_SIZE 65535

char buf[MAX_SIZE+1];

int receive_message(int s_fd, void *buf, size_t size, int flags, const char* error_message) {
    int r_size;
    if ((r_size = recv(s_fd, buf, MAX_SIZE, 0)) == -1) {
        perror(error_message);
        exit(EXIT_FAILURE);
    }
    ((char *)buf)[r_size] = '\0';
    printf("%s", (char *)buf);
    return r_size;
}


void send_message(int s_fd, const void *buf, size_t size, int flags, const char *message) {
    printf(">>> %s\n", message);
    send(s_fd, buf, size, flags);
}

void recv_mail()
{
    const char* host_name = "pop.qq.com"; // TODO: Specify the mail server domain name
    const unsigned short port = 110; // POP3 server port
    const char* user = "838818923@qq.com"; // TODO: Specify the user
    const char* pass = "tatboirwvsvsbegi"; // TODO: Specify the password
    char dest_ip[16];
    int s_fd; // socket file descriptor
    struct hostent *host;
    struct in_addr **addr_list;
    int i = 0;
    int r_size;

    // Get IP from domain name
    if ((host = gethostbyname(host_name)) == NULL)
    {
        herror("gethostbyname");
        exit(EXIT_FAILURE);
    }

    addr_list = (struct in_addr **) host->h_addr_list;
    while (addr_list[i] != NULL)
        ++i;
    strcpy(dest_ip, inet_ntoa(*addr_list[i-1]));

    // TODO: Create a socket,return the file descriptor to s_fd, and establish a TCP connection to the POP3 server
    if ((s_fd = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
        perror("socket");
        exit(EXIT_FAILURE);
    }
    struct sockaddr_in socket_address;
    // 写入protocol, 端口号和IP地址
    socket_address.sin_family = AF_INET;
    socket_address.sin_port = htons(port);
    socket_address.sin_addr.s_addr = inet_addr(dest_ip);
    bzero(&(socket_address.sin_zero), 8);
    connect(s_fd, (struct sockaddr*) &socket_address, sizeof(struct sockaddr));
    // Print welcome message
    receive_message(s_fd, buf, MAX_SIZE, 0, "recv welcome");
    // TODO: Send user and password and print server response
    // 用户名
    sprintf(buf, "USER %s\r\n", user);
    send_message(s_fd, buf, strlen(buf), 0, buf);
    receive_message(s_fd, buf, MAX_SIZE, 0, "recv USER");
    // 密码
    sprintf(buf, "PASS %s\r\n", pass);
    send_message(s_fd, buf, strlen(buf), 0, buf);
    receive_message(s_fd, buf, MAX_SIZE, 0, "recv PASS");
    // TODO: Send STAT command and print server response
    const char *STAT = "STAT\r\n";
    send_message(s_fd, STAT, strlen(STAT), 0, STAT);
    receive_message(s_fd, buf, MAX_SIZE, 0, "recv STAT");
    // TODO: Send LIST command and print server response
    const char *LIST = "LIST\r\n";
    send_message(s_fd, LIST, strlen(LIST), 0, LIST);
    receive_message(s_fd, buf, MAX_SIZE, 0, "recv LIST");
    // TODO: Retrieve the first mail and print its content
    const char *RETR = "RETR 1\r\n";
    send_message(s_fd, RETR, strlen(RETR), 0, RETR);
    r_size = receive_message(s_fd, buf, MAX_SIZE, 0, "recv RETR");
    int len = atoi(buf + 4);
    len -= r_size;
    while (len > 0) {
        r_size = receive_message(s_fd, buf, MAX_SIZE, 0, "recv EMAIL CONTENT");
        len -= r_size;
    }
    // TODO: Send QUIT command and print server response
    const char *QUIT = "QUIT\r\n";
    send_message(s_fd, QUIT, strlen(QUIT), 0, QUIT);
    receive_message(s_fd, buf, MAX_SIZE, 0, "recv QUIT");

    close(s_fd);
}

int main(int argc, char* argv[])
{
    recv_mail();
    exit(0);
}
