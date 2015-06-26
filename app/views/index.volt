{#所有的volt都是被public下的index.php加载过来的，所以引用css、js、img等直接引用就行了#}
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
{{ content() }}
</html>