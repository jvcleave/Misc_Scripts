#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <dirent.h>
#include <string.h>
#include <errno.h>


char * replace(
    char const * const original, 
    char const * const pattern, 
    char const * const replacement
) {
  size_t const replen = strlen(replacement);
  size_t const patlen = strlen(pattern);
  size_t const orilen = strlen(original);

  size_t patcnt = 0;
  const char * oriptr;
  const char * patloc;

  // find how many times the pattern occurs in the original string
  for (oriptr = original; patloc = strstr(oriptr, pattern); oriptr = patloc + patlen)
  {
    patcnt++;
  }

  {
    // allocate memory for the new string
    size_t const retlen = orilen + patcnt * (replen - patlen);
    char * const returned = (char *) malloc( sizeof(char) * (retlen + 1) );

    if (returned != NULL)
    {
      // copy the original string, 
      // replacing all the instances of the pattern
      char * retptr = returned;
      for (oriptr = original; patloc = strstr(oriptr, pattern); oriptr = patloc + patlen)
      {
        size_t const skplen = patloc - oriptr;
        // copy the section until the occurence of the pattern
        strncpy(retptr, oriptr, skplen);
        retptr += skplen;
        // copy the replacement 
        strncpy(retptr, replacement, replen);
        retptr += replen;
      }
      // copy the rest of the string.
      strcpy(retptr, oriptr);
    }
    return returned;
  }
}

int main()
{
    
	
	DIR* directory;
	struct dirent *entry;
	char folder[100] = "/home/pi/RPI_ROOT/usr/lib/arm-linux-gnueabihf";
		
	directory = opendir ((const char *)&folder);
	if (directory != NULL)
	{
		while (entry = readdir (directory))
		{
			if(entry->d_type ==DT_LNK)
			{
				struct stat statinfo;
				lstat(entry->d_name, &statinfo );
				char *linkname;
				//printf("%s\n", entry->d_name);
				linkname = malloc(100);
				char fullPath[100] = "/home/pi/RPI_ROOT/usr/lib/arm-linux-gnueabihf/";
				strcat(fullPath, entry->d_name);
				readlink(fullPath, linkname, 100);
			
				if (strstr(linkname, "/lib/") != NULL) 
				{
					printf("%s points to %s\n", entry->d_name, linkname);
					char * const relativeLink = replace(linkname, "/lib/", "../../../lib/");
					printf("relativeLink: %s\n", relativeLink);
					
					int doUnlink = 0;
					if(doUnlink)
					{
						int result = unlink(fullPath);
						printf("%d unlink result \n", result);
						if(result != -1)
						{
							int symLinkResult = symlink(fullPath, relativeLink);
							printf("symLinkResult %d \n", symLinkResult);
							if(symLinkResult == -1)
							{
								printf("symLinkResult ERROR %s\n", strerror(errno));
							}
						}else
						{
							printf("unlink ERROR %s\n", strerror(errno));
						}
					}
					
				}
	 
			}
		}
	  	closedir (directory);
	}



   exit(EXIT_SUCCESS);
}
