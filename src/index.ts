import v8 from 'v8';
import fs from 'fs';
import express, { Request, Response } from 'express';

const port = process.env.PORT ?? 8080;
const app = express();

// ref: https://nodejs.org/dist/latest-v14.x/docs/api/v8.html
process.on('SIGUSR1', () => {
    const fileName = `./heapdump_${Date.now()}.heapsnapshot`;

    console.info(`Start taking the heap dump. [${fileName}]`);

    const snapshotStream = v8.getHeapSnapshot();
    const fileStream = fs.createWriteStream(fileName);
    snapshotStream.pipe(fileStream);

    console.info(`Have taken the heap dump. [${fileName}]`);
});

app.get('/', (_req: Request, res: Response) => {
    res.send('It works!');
});

app.get('/busy-loop', () => {
    // eslint-disable-next-line no-constant-condition,no-empty
    while (true) {}
});

app.listen(port, () => {
    console.log(`Started (port=${port})`);
});
