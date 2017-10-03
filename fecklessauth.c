#include <stdio.h>

char msg[1024];

int match(char *s1, char *s2) {
  while( *s1 != '\0' && *s2 != 0 && *s1 == *s2 ){
    fflush(stdout);
    s1++; s2++;
  }
  return( *s1 - *s2 );
}

void welcome(char *str) { puts(str); }
void goodbye(char *str) { void exit(); puts(str); exit(1); }

int main(){
   char *good = "Message accepted, my dear friend!\n";
   char *evil = "Invalid password, get out of here!\n";
   char name[16], pw[16]; /* 16 characters for username & password */

   printf("Enter a message (1024 characters): ");
   fgets(msg, 1024, stdin);

   printf("User: "); gets(name);
   printf("Password: "); gets(pw);
   if( match(name,pw) == 0 )
      welcome(good);
   else
      goodbye(evil);
   printf("Your message is: %s\n", msg);
}


