import Head from 'next/head'
import styles from '../styles/Home.module.css'

export default function Home() {
    return (
        <div className={styles.container}>
            <Head>
                <title>Skal vi kose oss?</title>

                <link rel={"apple-touch-icon"} href={"/apple-touch-icon.png"}/>
                <link rel={"icon"} type={"image/x-icon"} href={"/favicons/favicon.ico"}/>
                <link rel={"icon"} type={"image/png"} sizes={"16x16"} href={"/favicons/favicon-16x16.png"}/>
                <link rel={"icon"} type={"image/png"} sizes={"32x32"} href={"/favicons/favicon-32x32.png"}/>
                <link rel={"manifest"} href={"/favicons/site.webmanifest"}/>
            </Head>

            <main className={styles.main}>
                <h1 className={styles.title}>
                    Ja.
                </h1>
            </main>

            <footer className={styles.footer}>
                © eolseng
            </footer>
        </div>
    )
}
