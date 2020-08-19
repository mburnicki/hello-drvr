#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

static int __init hello_drvr_init(void)
{
    pr_info( "Hello world!\n" );
    return 0;
}

static void __exit hello_drvr_exit(void)
{
    pr_info("End of the world\n");
}

module_init(hello_drvr_init);
module_exit(hello_drvr_exit);
MODULE_AUTHOR("Martin Burnicki <martin.burnicki@meinberg.de>");
MODULE_LICENSE("GPL");
