rm -r .\dist\
call npm install create-vue
call npm run build
call git add ./dist
call git commit -m "deploy"
call git subtree push --prefix dist origin gh-pages