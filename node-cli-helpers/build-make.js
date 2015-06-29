// https://github.com/arturadib/shelljs
require('shelljs/global');

var cmndsMap = {
  'wb' : "web-bundle"
}

if (process.argv[2] && process.argv[2].length && cmndsMap[process.argv[2].toUpperCase()]) {
  exec('make cidist OPTS="-pl :' + cmndsMap[process.argv[2].toUpperCase()] + ',:globex-karaf-dist" start');
} else {
  console.log('no valid build target specified');
  console.log('available bundles: ', cmndsMap);
  console.log('exiting');
}
