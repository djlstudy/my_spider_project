#include <iconv.h>
#include <string.h>
#include <stdio.h>
namespace my{
    
int code_convert(const char *from_charset,const char *to_charset,char *inbuf,int inlen,char *outbuf,int outlen);

int u2g(char *inbuf,int inlen,char *outbuf,int outlen);

int g2u(char *inbuf,size_t inlen,char *outbuf,size_t outlen);
}