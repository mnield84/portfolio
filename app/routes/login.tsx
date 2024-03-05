export default function SignupRoute() {
  return (
    <div className="container flex min-h-full flex-col justify-center pb-32 pt-20">
      <div className="mx-auto w-full max-w-lg">
        <div className="flex flex-col gap-3 text-center">
          <h1 className="text-h1">Welcome aboard!</h1>
          <p className="text-body-md text-muted-foreground">
            Please enter your details.
          </p>
        </div>
        <form
          method="POST"
          className="mx-auto flex min-w-[368px] max-w-sm flex-col gap-4"
        >
          <div>
            <label htmlFor="email-input">Email</label>
            <input id="email-input" name="email" type="email" />
          </div>
          <button className="w-full" type="submit">
            Create an account
          </button>
        </form>
      </div>
    </div>
  );
}
