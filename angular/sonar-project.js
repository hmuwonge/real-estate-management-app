const sonarqubeScanner = require('sonarqube-scanner');

sonarqubeScanner({
  serverUrl: 'https://sonarcloud.io',
  options: {
    'sonar.projectKey': 'hmuwonge_sawatech-practical-assignment',
    'sonar.projectName': 'Sawatech Practical Assignment',
    'sonar.projectDescription': 'Description of your Angular project',
    'sonar.sources': 'src',
    'sonar.tests': 'src',
    'sonar.test.inclusions': '**/*.spec.ts',
    'sonar.exclusions': '**/node_modules/**',
    'sonar.typescript.lcov.reportPaths': 'coverage/lcov.info',
    'sonar.sourceEncoding': 'UTF-8',
    'sonar.login': 'cc7ac3eda2435ae6416eba9a7d72b625cefb6bea'
  }
}, () => process.exit());