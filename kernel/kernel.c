void print_chars(char *c)
{
    char *video_memory = (char *)0xb8000;

    int idx = 0;
    while(c[idx] != '\0')
    {
        *video_memory = c[idx];
        video_memory += 2;
        idx++;
    }
}

void main()
{
    char *msg = "Hello from Meow Operating system";
    print_chars(msg);
}