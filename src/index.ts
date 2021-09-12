import v8 from 'v8';
import fs from 'fs';
import express, { Request, Response } from 'express';

const port = process.env.PORT ?? 8080;
const app = express();

process.on('SIGUSR2', () => {
    const fileName = `/tmp/${Date.now()}.heapsnapshot`;

    console.info(`Start taking the heap dump. [${fileName}]`);

    const snapshotStream = v8.getHeapSnapshot();
    const fileStream = fs.createWriteStream(fileName);
    snapshotStream.pipe(fileStream);

    console.info(`Have taken the heap dump. [${fileName}]`);
});

app.get('/', (_req: Request, res: Response) => {
    res.send('It works!');
});

app.listen(port, () => {
    console.log(`Started (port=${port})`);
});
