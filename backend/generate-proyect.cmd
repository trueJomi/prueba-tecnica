@echo off

:: Define la ruta base del proyecto como la carpeta actual
set "basePath=%CD%"

:: Crear la estructura de carpetas
for %%F in (
    "src",
    "src\controllers",
    "src\domain",
    "src\adapters",
    "src\validators",
    "src\libs",
    "src\instructure\db",
    "src\routes"
    "src\docs"
    "src\constant",
    "src\test",
    "src\types"
) do (
    if not exist "%basePath%\%%F" (
        mkdir "%basePath%\%%F"
        echo Carpeta creada: %basePath%\%%F
    )
)

:: Crear archivos básicos
for %%F in (
    "src\index.ts",
    "src\controllers\example.controller.ts",
    "src\domain\example.domain.ts",
    "src\adapters\example.adapter.ts",
    "src\validators\example.validate.ts",
    "src\instructure\db\example.instructure.ts",
    "src\instructure\exmple.instructure.ts",
    "src\test\example.test.ts",
    "src\docs\example.yml",
    "src\libs\lib.ts",
    "src\routes\example.route.ts",
    "src\constants\example.constants.ts",
) do (
    if not exist "%basePath%\%%F" (
        type nul > "%basePath%\%%F"
        echo Archivo creado: %basePath%\%%F
    )
)

:: Crear README.md si no existe
if not exist "%basePath%\README.md" (
    echo # Proyecto Backend > "%basePath%\README.md"
    echo Archivo creado: %basePath%\README.md
)

:: Crear .gitignore si no existe
if not exist "%basePath%\.gitignore" (
    (
        echo node_modules/
        echo dist/
        echo .env
    ) > "%basePath%\.gitignore"
    echo Archivo creado: %basePath%\.gitignore
)

:: Crear .eslintrc.json si no existe
if not exist "%basePath%\.eslintrc.json" (
    echo { > "%basePath%\.eslintrc.json"
    echo   "env": { >> "%basePath%\.eslintrc.json"
    echo     "es2021": true, >> "%basePath%\.eslintrc.json"
    echo     "node": true >> "%basePath%\.eslintrc.json"
    echo   }, >> "%basePath%\.eslintrc.json"
    echo   "root": true, >> "%basePath%\.eslintrc.json"
    echo   "extends": [ >> "%basePath%\.eslintrc.json"
    echo     "standard-with-typescript", >> "%basePath%\.eslintrc.json"
    echo     "plugin:@typescript-eslint/recommended" >> "%basePath%\.eslintrc.json"
    echo   ], >> "%basePath%\.eslintrc.json"
    echo   "parserOptions": { >> "%basePath%\.eslintrc.json"
    echo     "ecmaVersion": "latest", >> "%basePath%\.eslintrc.json"
    echo     "sourceType": "module", >> "%basePath%\.eslintrc.json"
    echo     "tsconfigRootDir": "./tsconfig.json" >> "%basePath%\.eslintrc.json"
    echo   }, >> "%basePath%\.eslintrc.json"
    echo   "ignorePatterns": [ >> "%basePath%\.eslintrc.json"
    echo     "node_modules", >> "%basePath%\.eslintrc.json"
    echo     "dist" >> "%basePath%\.eslintrc.json"
    echo   ], >> "%basePath%\.eslintrc.json"
    echo   "plugins": [ >> "%basePath%\.eslintrc.json"
    echo     "@typescript-eslint" >> "%basePath%\.eslintrc.json"
    echo   ], >> "%basePath%\.eslintrc.json"
    echo   "rules": { >> "%basePath%\.eslintrc.json"
    echo     "@typescript-eslint/explicit-function-return-type": "off", >> "%basePath%\.eslintrc.json"
    echo     "@typescript-eslint/no-explicit-any": "off", >> "%basePath%\.eslintrc.json"
    echo     "max-len": ["error", { "code": 120 }] >> "%basePath%\.eslintrc.json"
    echo   } >> "%basePath%\.eslintrc.json"
    echo } >> "%basePath%\.eslintrc.json"
    echo Archivo creado: %basePath%\.eslintrc.json
)
:: Crear tsconfig.json si no existe
if not exist "%basePath%\tsconfig.json" (
    echo { > "%basePath%\tsconfig.json"
    echo   "compilerOptions": { >> "%basePath%\tsconfig.json"
    echo     "target": "ES2020", >> "%basePath%\tsconfig.json"
    echo     "module": "NodeNext", >> "%basePath%\tsconfig.json"
    echo     "outDir": "./dist", >> "%basePath%\tsconfig.json"
    echo     "strict": true, >> "%basePath%\tsconfig.json"
    echo     "esModuleInterop": true, >> "%basePath%\tsconfig.json"
    echo     "resolveJsonModule": true, >> "%basePath%\tsconfig.json"
    echo     "skipLibCheck": true, >> "%basePath%\tsconfig.json"
    echo     "forceConsistentCasingInFileNames": true, >> "%basePath%\tsconfig.json"
    echo     "allowJs": true >> "%basePath%\tsconfig.json"
    echo   }, >> "%basePath%\tsconfig.json"
    echo   "include": [ >> "%basePath%\tsconfig.json"
    echo     "./**/*.ts", >> "%basePath%\tsconfig.json"
    echo     "./src/**/*.ts" >> "%basePath%\tsconfig.json"
    echo   ], >> "%basePath%\tsconfig.json"
    echo   "exclude": ["node_modules", "dist"] >> "%basePath%\tsconfig.json"
    echo } >> "%basePath%\tsconfig.json"
    echo Archivo creado: %basePath%\tsconfig.json
)

:: Crear jest.config.js si no existe
if not exist "%basePath%\jest.config.js" (
    (
        echo const config = {
        echo   verbose: true,
        echo   expand: true,
        echo   testTimeout: 10000
        echo };
        echo module.exports = config;
    ) > "%basePath%\jest.config.js"
    echo Archivo creado: %basePath%\jest.config.js
)

:: Crear nodemon.json si no existe
if not exist "%basePath%\nodemon.json" (
    echo { > "%basePath%\nodemon.json"
    echo   "ext": ".js, .mjs, .coffee, .json, .yaml, .env, .ts" >> "%basePath%\nodemon.json"
    echo } >> "%basePath%\nodemon.json"
    echo Archivo creado: %basePath%\nodemon.json
)

:: Inicializar un proyecto de Node.js
if not exist "%basePath%\package.json" (
    echo Inicializando un nuevo proyecto de Node.js...
    npm init -y
    echo Proyecto Node.js inicializado.
)

:: Instalar dependencias
echo Instalando dependencias...
call npm install @prisma/client cors express yamljs zod swagger-ui-express

:: Instalar dependencias de desarrollo
echo Instalando dependencias de desarrollo...
call npm install --save-dev @jest/globals @swc/core @swc/helpers @types/body-parser @types/cors @types/express @types/jest @types/node @types/swagger-ui-express @types/yamljs @typescript-eslint/eslint-plugin@^6.21.0 @typescript-eslint/parser@^6.14.0 eslint@^8.57.0 eslint-config-standard-with-typescript@^43.0.1 eslint-plugin-import@^2.29.1 eslint-plugin-n@^16.6.2 eslint-plugin-promise@^6.6.0  jest nodemon ts-node typescript@^5.7.2 typescript-eslint@^8.29.0

echo Estructura del proyecto creada e inicialización completada en: %basePath%
exit